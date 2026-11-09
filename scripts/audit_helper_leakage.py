#!/usr/bin/env python3
"""Cryptographic Audit Script: Helper Data Information Leakage Analysis.

Demonstrates mathematically and empirically the exact vulnerability in the naive
BCH(31, 16, 3) parity helper data scheme:
  - For any 15-bit parity helper data, dim(ker(Parity)) = 16 - 15 = 1.
  - The non-zero kernel basis vector is g(x) = 0x8FAF (BCH generator polynomial).
  - There are exactly TWO possible 16-bit responses per block: m and m ^ 0x8FAF.
  - For a 64-bit response (4 blocks), an attacker knowing the 4 helper values
    recovers the exact 16 candidate 64-bit responses in < 1 millisecond.

Reference:
  - Dodis et al., "Fuzzy Extractors: How to Generate Strong Keys from Biometrics
    and Other Noisy Data", SIAM J. Comput., 2008.
  - Maes & Verbauwhede, "Physically Unclonable Functions: a Study on the State of
    the Art and Future Trends", Springer, 2012.
"""

import sys
import time
import secrets
from pathlib import Path

# Add scripts directory to path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from crypto_engine import BCH31_16_3, MultiBlockFuzzyExtractor


def audit_kernel_dimension():
    """Verify that every 15-bit parity has exactly 2 pre-images separated by 0x8FAF."""
    print("=" * 80)
    print("  TEST 1: BCH(31, 16, 3) PARITY KERNEL DIMENSION & GENERATOR SPAN")
    print("=" * 80)
    
    # 0x8FAF is the BCH generator polynomial
    null_vector = 0x8FAF
    parity_null = BCH31_16_3.get_parity(null_vector)
    print(f"BCH Generator Polynomial g(x) = 0x{null_vector:04X}")
    print(f"Parity of g(x): 0x{parity_null:04X} (Must be 0x0000 for null space)")
    assert parity_null == 0, "g(x) must have zero parity!"
    
    # Test random 16-bit blocks
    tested = 0
    for _ in range(50):
        m = secrets.randbits(16)
        p = BCH31_16_3.get_parity(m)
        m_dual = m ^ null_vector
        p_dual = BCH31_16_3.get_parity(m_dual)
        assert p == p_dual, f"Parity mismatch for 0x{m:04X} and 0x{m_dual:04X}"
        tested += 1
        
    print(f"[PASS] Verified across {tested} random 16-bit words:")
    print("       For ANY message m, Parity(m) == Parity(m ^ 0x8FAF)")
    print("       dim(ker(Parity)) = 16 - 15 = 1 => Exactly 2 candidates per 16-bit block.\n")


def exploit_naive_helper_data(secret_response64: int):
    """Simulates an attacker intercepting 4 public helper values and cracking the key."""
    print("=" * 80)
    print("  TEST 2: LIVE ATTACK ON 64-BIT NAIVE HELPER DATA (4 BLOCKS)")
    print("=" * 80)
    
    # Legitimate enrollment
    _, helpers = MultiBlockFuzzyExtractor.generate(secret_response64, total_bits=64)
    print(f"Victim Secret PUF Response : 0x{secret_response64:016X}")
    print(f"Public Helper Values (4x15): {[f'0x{h:04X}' for h in helpers]}")
    
    # Attacker starts clock
    t0 = time.perf_counter()
    
    # Attacker computes pre-image for each block
    null_vector = 0x8FAF
    block_candidates = []
    
    for h in helpers:
        # Attacker solves linear system Parity(x) = h
        # Fast solver: find one solution x0 by solving 15 equations in 16 unknowns,
        # then the two solutions are x0 and x0 ^ 0x8FAF.
        # Since 0..65535 is tiny, even a linear sweep takes microseconds:
        cands = []
        for trial in range(65536):
            if BCH31_16_3.get_parity(trial) == h:
                cands.append(trial)
                cands.append(trial ^ null_vector)
                break
        block_candidates.append(cands)
        
    # Cartesian product of candidates across 4 blocks = 2 * 2 * 2 * 2 = 16
    recovered_keys = []
    for b0 in block_candidates[0]:
        for b1 in block_candidates[1]:
            for b2 in block_candidates[2]:
                for b3 in block_candidates[3]:
                    candidate_key = b0 | (b1 << 16) | (b2 << 32) | (b3 << 48)
                    recovered_keys.append(candidate_key)
                    
    elapsed_us = (time.perf_counter() - t0) * 1e6
    
    print(f"\n[ATTACK RESULT]")
    print(f"Total Candidate Keys Found : {len(recovered_keys)} (Out of 2^64 = 18,446,744,073,709,551,616)")
    print(f"Remaining Min-Entropy      : log2({len(recovered_keys)}) = 4.00 bits (60 bits LEAKED!)")
    print(f"Time Taken to Crack Space  : {elapsed_us:.2f} microseconds")
    print(f"Victim Key in Candidates?  : {secret_response64 in recovered_keys}")
    print(f"Candidate Set: {[f'0x{k:016X}' for k in recovered_keys[:4]]} ... ({len(recovered_keys)} total)")
    print("=" * 80 + "\n")


if __name__ == '__main__':
    audit_kernel_dimension()
    secret_puf = secrets.randbits(64)
    exploit_naive_helper_data(secret_puf)
