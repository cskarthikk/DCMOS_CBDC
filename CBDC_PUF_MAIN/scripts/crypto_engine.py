"""Cryptographic Processing Engine for CBDC-PUF: SHA-3 and BCH(31, 16, 3).

Based on:
  Yanjiang Liu et al., "CBDC-PUF: A Novel Physical Unclonable Function Design
  Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"
  ACM TODAES, Vol. 28, No. 5, Article 78, Sept 2023.

Supports:
  - 8-core, 16-core, 64-core, and 128-core architectures.
  - NIST SHA-3 (SHAKE-256) arbitrary-length non-linear challenge preprocessing.
  - BCH(31, 16, 3) multi-block systematic error-correction codec.
"""

import hashlib
import json
from pathlib import Path
from typing import Tuple, List, Optional

# GF(2^5) primitive polynomial: p(x) = x^5 + x^2 + 1
GF_POLY = 0x25

# BCH(31, 16, 3) generator polynomial:
# g(x) = m1(x) * m3(x) * m5(x) = 0x8FAF (degree 15)
BCH_GEN = 0x8FAF


class GF2_5:
    """Galois Field GF(2^5) arithmetic table generator."""
    def __init__(self):
        self.alpha_to = [0] * 32
        self.index_of = [0] * 32
        
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
        s = [0] * 7
        for j in range(1, 7):
            val = 0
            for i in range(31):
                if (codeword31 >> i) & 1:
                    val ^= gf.alpha_to[(i * j) % 31]
            s[j] = val
        
        if all(s[j] == 0 for j in range(1, 7)):
            return codeword31, 0, True

        # 2. Berlekamp-Massey Algorithm for Error-Locator Polynomial Lambda(x)
        C = [1] + [0] * 7
        B = [1] + [0] * 7
        L = 0
        m = 1
        b = 1

        for n in range(6):
            d = s[n + 1]
            for i in range(1, min(L + 1, 8)):
                if n + 1 - i >= 1:
                    d ^= gf.mul(C[i], s[n + 1 - i])
            
            if d == 0:
                m += 1
            else:
                scale = gf.mul(d, gf.inv(b))
                T = list(C)
                for i in range(8):
                    if i >= m:
                        C[i] ^= gf.mul(scale, B[i - m])
                if 2 * L <= n:
                    L = n + 1 - L
                    B = T
                    b = d
                    m = 1
                else:
                    m += 1

        if L > 3 or L == 0:
            return codeword31, L, False

        # 3. Chien Search: evaluate Lambda(alpha^(-i)) for i = 0..30
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
    """Helper-data Fuzzy Extractor for single 16-bit PUF block."""
    
    @staticmethod
    def generate(ref_response16: int) -> Tuple[int, int]:
        helper_data = BCH31_16_3.get_parity(ref_response16)
        return ref_response16, helper_data

    @staticmethod
    def reproduce(noisy_response16: int, helper_data15: int) -> Tuple[int, int, bool]:
        codeword = ((noisy_response16 & 0xFFFF) << 15) | (helper_data15 & 0x7FFF)
        corrected_cw, errs, ok = BCH31_16_3.decode(codeword)
        reconstructed = (corrected_cw >> 15) & 0xFFFF
        return reconstructed, errs, ok


class MultiBlockFuzzyExtractor:
    """Multi-block Fuzzy Extractor supporting 16-bit, 32-bit, 64-bit, and 128-bit PUF keys."""
    
    @staticmethod
    def generate(ref_key: int, total_bits: int = 64) -> Tuple[int, List[int]]:
        num_blocks = total_bits // 16
        helpers = []
        for i in range(num_blocks):
            block16 = (ref_key >> (i * 16)) & 0xFFFF
            _, h = FuzzyExtractor.generate(block16)
            helpers.append(h)
        return ref_key, helpers

    @staticmethod
    def reproduce(noisy_key: int, helpers: List[int], total_bits: int = 64) -> Tuple[int, int, bool]:
        num_blocks = total_bits // 16
        reconstructed = 0
        total_errs = 0
        all_ok = True
        
        for i in range(num_blocks):
            noisy16 = (noisy_key >> (i * 16)) & 0xFFFF
            h = helpers[i]
            rec16, errs, ok = FuzzyExtractor.reproduce(noisy16, h)
            if not ok:
                all_ok = False
            total_errs += errs
            reconstructed |= (rec16 << (i * 16))
            
        return reconstructed, total_errs, all_ok


class SHA3ChallengePreprocessor:
    """NIST SHA-3 (SHAKE-256) Challenge Preprocessor (Paper Section 3.2, 4.1)."""
    
    @staticmethod
    def hash_challenge(raw_challenge: bytes, num_cores: int = 64) -> List[int]:
        """Preprocesses an external challenge using NIST SHAKE-256 to produce odd-parity 16-bit configs.
        
        For 8 cores: produces 128 bits (16 bytes).
        For 64 cores: produces 1024 bits (128 bytes).
        For 128 cores: produces 2048 bits (256 bytes) exactly matching Section 4.1!
        """
        needed_bytes = num_cores * 2
        digest = hashlib.shake_256(raw_challenge).digest(needed_bytes)
        
        configs = []
        for core_idx in range(num_cores):
            b0 = digest[core_idx * 2]
            b1 = digest[core_idx * 2 + 1]
            cfg = (b0 << 8) | b1
            
            # Enforce odd parity on 16-bit configuration for fixed-AND gate race launching
            ones = bin(cfg & 0x7FFF).count('1')
            if ones % 2 == 0:
                cfg = (cfg & 0x7FFF) | 0x8000
            else:
                cfg = cfg & 0x7FFF
            configs.append(cfg)
            
        return configs


if __name__ == '__main__':
    print('Testing BCH(31, 16, 3) Codec and 64-core Multi-Block Fuzzy Extractor...')
    import random
    random.seed(2026)
    
    # Test 64-bit Multi-block (4 blocks x 16 bits)
    for _ in range(500):
        key64 = random.getrandbits(64)
        _, helpers = MultiBlockFuzzyExtractor.generate(key64, total_bits=64)
        noisy64 = key64
        # Inject random errors (0..3 per block)
        for b in range(4):
            k = random.randint(0, 3)
            pos = random.sample(range(16), k)
            for p in pos:
                noisy64 ^= (1 << (b * 16 + p))
        rec, errs, ok = MultiBlockFuzzyExtractor.reproduce(noisy64, helpers, total_bits=64)
        assert ok and rec == key64
        
    print('PASS: 500 / 500 64-bit multi-block BCH(31, 16, 3) tests passed 100%!')
    
    # Test 64-core SHA-3 challenge generator
    cfgs = SHA3ChallengePreprocessor.hash_challenge(b'Basys3_64Core_Experiment', num_cores=64)
    assert len(cfgs) == 64
    for c in cfgs:
        assert bin(c).count('1') % 2 == 1, 'All 64 configurations must have odd parity!'
    print(f'PASS: SHA-3 generated 64 odd-parity configurations (first 4: {[hex(c) for c in cfgs[:4]]})')
    print('All cryptographic modules verified successfully for 64 cores.')
