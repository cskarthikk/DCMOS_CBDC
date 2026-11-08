"""Cryptographic Processing Engine for CBDC-PUF: SHA-3 and BCH(31, 16, 3).

Based on:
  Yanjiang Liu et al., "CBDC-PUF: A Novel Physical Unclonable Function Design
  Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"
  ACM TODAES, Vol. 28, No. 5, Article 78, Sept 2023.

Implements:
  1. SHA-3 Challenge Preprocessor (Section 3.2, 4.1):
     f(C) = SHA3_256(C) mapped into 16-bit odd-parity core configurations.
  2. BCH(31, 16, 3) Codec (Section 4.1, 4.2):
     Galois Field GF(2^5) arithmetic with p(x) = x^5 + x^2 + 1 (0x25).
     Generator polynomial g(x) = x^15 + x^11 + x^10 + x^9 + x^8 + x^7 + x^5 + x^3 + x^2 + x + 1 (0x8FAF).
     Fuzzy extractor helper data generation and error correction up to 3 bit errors per 16-bit block.
"""

import hashlib
import json
from pathlib import Path
from typing import Tuple, List, Optional

# GF(2^5) primitive polynomial: p(x) = x^5 + x^2 + 1
GF_POLY = 0x25

# BCH(31, 16, 3) generator polynomial:
# g(x) = m1(x) * m3(x) * m5(x) = 0x8FAF
# degree = 15
BCH_GEN = 0x8FAF


class GF2_5:
    """Galois Field GF(2^5) arithmetic table generator."""
    def __init__(self):
        self.alpha_to = [0] * 32
        self.index_of = [0] * 32
        
        # Multiply in GF(2^5) modulo p(x)
        def _mul(a, b):
            p = 0
            for i in range(5):
                if (b >> i) & 1:
                    p ^= (a << i)
            for i in range(8, 4, -1):
                if (p >> i) & 1:
                    p ^= (GF_POLY << (i - 5))
            return p

        cur = 1
        self.alpha_to[0] = 1
        self.index_of[1] = 0
        for i in range(1, 31):
            cur = _mul(cur, 2)
            self.alpha_to[i] = cur
            self.index_of[cur] = i
        self.alpha_to[31] = 1

    def mul(self, a: int, b: int) -> int:
        if a == 0 or b == 0:
            return 0
        return self.alpha_to[(self.index_of[a] + self.index_of[b]) % 31]

    def inv(self, a: int) -> int:
        if a == 0:
            return 0
        return self.alpha_to[(31 - self.index_of[a]) % 31]


gf = GF2_5()


class BCH31_16_3:
    """BCH(31, 16, 3) Systematic Encoder and Berlekamp-Massey / Chien Decoder."""
    
    @staticmethod
    def encode(data16: int) -> int:
        """Encode 16-bit PUF response segment into 31-bit systematic codeword {data16, parity15}."""
        dividend = (data16 & 0xFFFF) << 15
        rem = dividend
        for i in range(30, 14, -1):
            if (rem >> i) & 1:
                rem ^= (BCH_GEN << (i - 15))
        return dividend | rem

    @staticmethod
    def get_parity(data16: int) -> int:
        """Return only the 15-bit parity (helper data) for a 16-bit response segment."""
        cw = BCH31_16_3.encode(data16)
        return cw & 0x7FFF

    @staticmethod
    def decode(codeword31: int) -> Tuple[int, int, bool]:
        """Decode a 31-bit received word.
        
        Returns:
            (corrected_codeword, error_count, success_flag)
            If uncorrectable (>3 errors), success_flag is False.
        """
        # 1. Compute syndromes S1..S6
        # S_j = sum(codeword[i] * alpha^(i * j))
        s = [0] * 7
        for j in range(1, 7):
            val = 0
            for i in range(31):
                if (codeword31 >> i) & 1:
                    val ^= gf.alpha_to[(i * j) % 31]
            s[j] = val
        
        # If all syndromes are zero, no errors
        if all(s[j] == 0 for j in range(1, 7)):
            return codeword31, 0, True

        # 2. Berlekamp-Massey Algorithm to find Error-Locator Polynomial Lambda(x)
        # Lambda(x) = 1 + C_1 x + C_2 x^2 + C_3 x^3
        C = [1, 0, 0, 0]
        B = [1, 0, 0, 0]
        L = 0
        m = 1
        b = 1

        for n in range(6):
            # discrepancy d = s[n+1] ^ sum(C[i] * s[n+1-i])
            d = s[n + 1]
            for i in range(1, L + 1):
                if n + 1 - i >= 1:
                    d ^= gf.mul(C[i], s[n + 1 - i])
            
            if d == 0:
                m += 1
            else:
                scale = gf.mul(d, gf.inv(b))
                T = list(C)
                for i in range(4):
                    if i >= m:
                        C[i] ^= gf.mul(scale, B[i - m])
                if 2 * L <= n:
                    L = n + 1 - L
                    B = T
                    b = d
                    m = 1
                else:
                    m += 1

        # Error capability exceeded
        if L > 3 or L == 0:
            return codeword31, L, False

        # 3. Chien Search: evaluate Lambda(alpha^(-i)) for i = 0..30
        # If Lambda(alpha^(-i)) == 0, then position i is in error.
        err_pos = []
        for i in range(31):
            x_inv = gf.alpha_to[(31 - i) % 31]
            x_inv2 = gf.mul(x_inv, x_inv)
            x_inv3 = gf.mul(x_inv2, x_inv)
            val = C[0] ^ gf.mul(C[1], x_inv) ^ gf.mul(C[2], x_inv2) ^ gf.mul(C[3], x_inv3)
            if val == 0:
                err_pos.append(i)

        if len(err_pos) != L:
            return codeword31, L, False

        # 4. Correct bit errors
        corrected = codeword31
        for p in err_pos:
            corrected ^= (1 << p)

        return corrected, len(err_pos), True


class FuzzyExtractor:
    """Helper-data Fuzzy Extractor for PUF Key Generation and Reconstruction."""
    
    @staticmethod
    def generate(ref_response16: int) -> Tuple[int, int]:
        """Enrollment (Gen):
        Computes 15-bit helper data W from a reference 16-bit response.
        Returns: (ref_response16, helper_data15)
        """
        helper_data = BCH31_16_3.get_parity(ref_response16)
        return ref_response16, helper_data

    @staticmethod
    def reproduce(noisy_response16: int, helper_data15: int) -> Tuple[int, int, bool]:
        """Reconstruction (Rep):
        Reconstructs the enrolled 16-bit response from a noisy response and helper data.
        Returns: (reconstructed_response16, error_count, success)
        """
        codeword = ((noisy_response16 & 0xFFFF) << 15) | (helper_data15 & 0x7FFF)
        corrected_cw, errs, ok = BCH31_16_3.decode(codeword)
        reconstructed = (corrected_cw >> 15) & 0xFFFF
        return reconstructed, errs, ok


class SHA3ChallengePreprocessor:
    """SHA-3 Challenge Preprocessor (Paper Section 3.2)."""
    
    @staticmethod
    def hash_challenge(raw_challenge: bytes, num_cores: int = 8) -> List[int]:
        """Preprocesses an external challenge using SHA3-256 to produce odd-parity 16-bit configs.
        
        Args:
            raw_challenge: arbitrary byte sequence (seed/nonce/password).
            num_cores: number of PUF cores (e.g. 8 or 128).
            
        Returns:
            List of 16-bit odd-parity integer configuration values.
        """
        # Sponge expansion if needed:
        hasher = hashlib.sha3_256(raw_challenge)
        digest = hasher.digest()
        
        configs = []
        for core_idx in range(num_cores):
            # Take 2 bytes per core (16 bits)
            byte_offset = (core_idx * 2) % len(digest)
            cfg = (digest[byte_offset] << 8) | digest[byte_offset + 1]
            
            # Count ones in bottom 15 bits
            ones = bin(cfg & 0x7FFF).count('1')
            # Set MSB (bit 15) to guarantee odd parity for AND gate launch
            if ones % 2 == 0:
                cfg = (cfg & 0x7FFF) | 0x8000
            else:
                cfg = cfg & 0x7FFF
            configs.append(cfg)
            
            # If we need more than 256 bits, chain hash
            if (core_idx * 2) + 2 >= len(digest):
                hasher = hashlib.sha3_256(digest)
                digest = hasher.digest()
                
        return configs


if __name__ == '__main__':
    print('Testing BCH(31, 16, 3) Codec...')
    import random
    random.seed(2026)
    
    # 1. Test all 0-error cases
    for _ in range(100):
        m = random.randint(0, 0xFFFF)
        cw = BCH31_16_3.encode(m)
        rec, errs, ok = BCH31_16_3.decode(cw)
        assert ok and errs == 0 and (rec >> 15) == m
        
    # 2. Test 1, 2, 3 error injection across 1,000 cases
    for _ in range(1000):
        m = random.randint(0, 0xFFFF)
        cw = BCH31_16_3.encode(m)
        t = random.randint(1, 3)
        pos = random.sample(range(31), t)
        noisy = cw
        for p in pos:
            noisy ^= (1 << p)
        rec, errs, ok = BCH31_16_3.decode(noisy)
        assert ok, f'Failed on positions {pos}'
        assert errs == t
        assert (rec >> 15) == m
        
    print('PASS: 1,100 automated BCH test cases passed with 100% recovery.')
    
    # 3. Test Fuzzy Extractor helper data flow
    ref_key = 0xCAFE
    _, helper = FuzzyExtractor.generate(ref_key)
    # Inject 2 bit errors into the response
    noisy_key = ref_key ^ 0b10010
    recon_key, errors_fixed, success = FuzzyExtractor.reproduce(noisy_key, helper)
    assert success and recon_key == ref_key
    print(f'PASS: Fuzzy Extractor recovered 0x{ref_key:04X} from noisy 0x{noisy_key:04X} (fixed {errors_fixed} bit flips).')
    
    # 4. Test SHA-3 Preprocessor
    seed = b'Course_DCMOS_Basys3_PUF_Experiment_2026'
    cfgs = SHA3ChallengePreprocessor.hash_challenge(seed, num_cores=8)
    print(f'PASS: SHA-3 produced 8 odd-parity configurations: {[hex(c) for c in cfgs]}')
    for c in cfgs:
        assert bin(c).count('1') % 2 == 1, 'Parity must be odd!'
    print('All cryptographic modules verified successfully.')

