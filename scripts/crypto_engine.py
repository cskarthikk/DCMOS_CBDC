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


class DodisCodeOffsetFuzzyExtractor:
    """BCH code-offset reconstruction of a random 16-bit enrollment secret.

    Helper W = R XOR Encode(S) permits reconstruction from a noisy 31-bit R.
    Secrecy depends on the conditional entropy of R given public information
    and W; choosing S randomly does not guarantee secrecy after W is public.
    Codec success is not an entropy or secure-key-strength assessment.
    """

    @staticmethod
    def generate(puf_response31: int, secret16: Optional[int] = None) -> Tuple[int, int]:
        """Generate (secret16, helper_data31) from a 31-bit PUF response.
        
        Args:
            puf_response31: 31-bit physical PUF response.
            secret16: Optional 16-bit secret. If None, generated using secrets module.
            
        Returns:
            (secret16, helper_data31)
        """
        import secrets as sec_mod
        if secret16 is None:
            secret16 = sec_mod.randbits(16)
        secret16 &= 0xFFFF
        
        codeword31 = BCH31_16_3.encode(secret16)
        helper_data31 = (puf_response31 & 0x7FFFFFFF) ^ codeword31
        return secret16, helper_data31

    @staticmethod
    def reproduce(noisy_response31: int, helper_data31: int) -> Tuple[int, int, bool]:
        """Reconstruct secret16 from noisy response and public helper data.
        
        Returns:
            (recovered_secret16, error_count, success_flag)
        """
        noisy_codeword = (noisy_response31 & 0x7FFFFFFF) ^ (helper_data31 & 0x7FFFFFFF)
        corrected_cw, errs, ok = BCH31_16_3.decode(noisy_codeword)
        if not ok:
            return 0, errs, False
        recovered_secret = (corrected_cw >> 15) & 0xFFFF
        return recovered_secret, errs, True


class SecureFuzzyExtractor:
    """Multi-challenge code-offset reconstruction and hash-output demonstration.

    Two 31-bit blocks use cores 0..61; cores 62..63 are excluded.
    The output-bit setting determines a nominal secret budget and output length,
    not measured physical min-entropy. Joint/core/challenge dependence and public
    helper leakage must be assessed before assigning cryptographic strength.
    Class and CLI names are retained for compatibility.
    """

    @staticmethod
    def extract_blocks64(response64: int) -> Tuple[int, int]:
        """Extract two 31-bit blocks from a 64-bit response."""
        b0 = response64 & 0x7FFFFFFF
        b1 = (response64 >> 31) & 0x7FFFFFFF
        return b0, b1

    @classmethod
    def generate(cls, puf_responses64: List[int], target_key_bits: int = 256,
                 provided_secrets: Optional[List[int]] = None) -> Tuple[bytes, List[int], List[int]]:
        """Enrollment: Generate cryptographic master key and helper data list.
        
        Args:
            puf_responses64: List of 64-bit physical responses (one per challenge).
            target_key_bits: Desired master key size (128 or 256 bits).
            provided_secrets: Optional pre-defined 16-bit secrets for testing.
            
        Returns:
            (master_key_bytes, helper_data_list, secrets_list)
        """
        import secrets as sec_mod
        num_blocks_needed = (target_key_bits + 15) // 16
        num_challenges_needed = (num_blocks_needed + 1) // 2
        
        if len(puf_responses64) < num_challenges_needed:
            raise ValueError(f"Need at least {num_challenges_needed} challenges for {target_key_bits}-bit key, "
                             f"got {len(puf_responses64)}")
                             
        helpers = []
        secrets_list = []
        sec_idx = 0
        
        for c_idx in range(num_challenges_needed):
            b0, b1 = cls.extract_blocks64(puf_responses64[c_idx])
            for blk in (b0, b1):
                if sec_idx < num_blocks_needed:
                    s_val = provided_secrets[sec_idx] if provided_secrets else sec_mod.randbits(16)
                    s_val, h_val = DodisCodeOffsetFuzzyExtractor.generate(blk, s_val)
                    helpers.append(h_val)
                    secrets_list.append(s_val)
                    sec_idx += 1
                    
        # Hash-based derivation; no information-theoretic extraction claim
        secret_bytes = bytearray()
        for s in secrets_list:
            secret_bytes.extend(s.to_bytes(2, 'big'))
            
        if target_key_bits <= 256:
            master_key = hashlib.sha256(secret_bytes).digest()[:target_key_bits // 8]
        else:
            master_key = hashlib.shake_256(secret_bytes).digest(target_key_bits // 8)
            
        return bytes(master_key), helpers, secrets_list

    @classmethod
    def reproduce(cls, noisy_responses64: List[int], helpers: List[int],
                  target_key_bits: int = 256) -> Tuple[bytes, int, bool]:
        """Reconstruction: Reproduce the master key from noisy responses and helper data.
        
        Returns:
            (master_key_bytes, total_errors_corrected, success_flag)
        """
        num_blocks_needed = len(helpers)
        reconstructed_secrets = []
        total_errs = 0
        all_ok = True
        h_idx = 0
        
        for r64 in noisy_responses64:
            if h_idx >= num_blocks_needed:
                break
            b0, b1 = cls.extract_blocks64(r64)
            for blk in (b0, b1):
                if h_idx < num_blocks_needed:
                    h_val = helpers[h_idx]
                    s_rec, errs, ok = DodisCodeOffsetFuzzyExtractor.reproduce(blk, h_val)
                    if not ok:
                        all_ok = False
                    total_errs += errs
                    reconstructed_secrets.append(s_rec)
                    h_idx += 1
                    
        if not all_ok:
            return b'', total_errs, False
            
        secret_bytes = bytearray()
        for s in reconstructed_secrets:
            secret_bytes.extend(s.to_bytes(2, 'big'))
            
        if target_key_bits <= 256:
            master_key = hashlib.sha256(secret_bytes).digest()[:target_key_bits // 8]
        else:
            master_key = hashlib.shake_256(secret_bytes).digest(target_key_bits // 8)
            
        return bytes(master_key), total_errs, True


class LegacyParityFuzzyExtractor:
    """Legacy Parity Fuzzy Extractor (For Paper Channel ECC Replication Only).
    
    WARNING: In this legacy scheme, publishing the 15-bit parity reveals all but 1 bit
    of uncertainty per 16-bit block (dim(ker) = 1). Across 4 blocks, only 16 candidate
    candidates remain (at most 4 bits of uncertainty).
    
    Use this class ONLY for verifying the raw channel error-correction capability
    (WER = 0%) matching Liu et al. Section 4.1. Code-offset reconstruction is available in SecureFuzzyExtractor; assess entropy separately.
    """
    
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


# Maintain backward compatibility aliases
FuzzyExtractor = LegacyParityFuzzyExtractor


class MultiBlockFuzzyExtractor:
    """Legacy Multi-block Systematic Codec (Paper Section 4.1 Channel Error Correction)."""
    
    @staticmethod
    def generate(ref_key: int, total_bits: int = 64) -> Tuple[int, List[int]]:
        num_blocks = total_bits // 16
        helpers = []
        for i in range(num_blocks):
            block16 = (ref_key >> (i * 16)) & 0xFFFF
            _, h = LegacyParityFuzzyExtractor.generate(block16)
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
            rec16, errs, ok = LegacyParityFuzzyExtractor.reproduce(noisy16, h)
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
    
    # Test code-offset reconstruction (500 trials)
    print('Testing code-offset enrollment/reconstruction...')
    for _ in range(500):
        # 8 challenges (16 nominal 16-bit secrets; actual retained entropy unmeasured)
        ref_responses = [random.getrandbits(64) for _ in range(8)]
        master_key, helpers, secrets_list = SecureFuzzyExtractor.generate(ref_responses, target_key_bits=256)
        
        # Inject up to 3 physical bit errors per 31-bit block into noisy responses
        noisy_responses = []
        for r in ref_responses:
            b0 = r & 0x7FFFFFFF
            b1 = (r >> 31) & 0x7FFFFFFF
            # inject 0..3 errors into b0 and b1
            for p in random.sample(range(31), random.randint(0, 3)):
                b0 ^= (1 << p)
            for p in random.sample(range(31), random.randint(0, 3)):
                b1 ^= (1 << p)
            noisy_responses.append(b0 | (b1 << 31))
            
        rec_key, errs, ok = SecureFuzzyExtractor.reproduce(noisy_responses, helpers, target_key_bits=256)
        assert ok, "Secure reconstruction failed!"
        assert rec_key == master_key, "Reconstructed key does not match master key!"
        
    print('PASS: 500 / 500 code-offset reconstruction tests passed (256-bit output; entropy not assessed)!')
    
    # Test 64-core SHA-3 challenge generator
    cfgs = SHA3ChallengePreprocessor.hash_challenge(b'Basys3_64Core_Experiment', num_cores=64)
    assert len(cfgs) == 64
    for c in cfgs:
        assert bin(c).count('1') % 2 == 1, 'All 64 configurations must have odd parity!'
    print(f'PASS: SHA-3 generated 64 odd-parity configurations (first 4: {[hex(c) for c in cfgs[:4]]})')
    print('Reconstruction and configuration self-tests passed for 64 cores; secrecy not assessed.')
