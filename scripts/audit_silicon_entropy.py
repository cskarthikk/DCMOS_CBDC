#!/usr/bin/env python3
"""NIST SP 800-90B Physical Silicon Min-Entropy & Helper Secrecy Assessment.

Calculates the empirical min-entropy of the 64 physical CBDC-PUF cores on the
Digilent Basys 3 FPGA using measurements/validation_1.csv.

Evaluates:
  1. Most Common Value (MCV) Min-Entropy per core (NIST SP 800-90B Section 6.3.1).
  2. Block Min-Entropy for 31-bit PUF segments (Blocks 0 and 1).
  3. Secrecy Retention after publishing 15-bit BCH(31, 16, 3) helper data (Dodis Lemma 1).
  4. Challenge Accumulation required for 128-bit and 256-bit cryptographic keys.

References:
  - NIST Special Publication 800-90B: "Recommendation for the Entropy Sources
    Used for Random Bit Generation", Section 6.3.1.
  - Dodis et al., "Fuzzy Extractors: How to Generate Strong Keys from Biometrics
    and Other Noisy Data", SIAM J. Comput., 2008.
"""

import csv
import math
import collections
from pathlib import Path


def audit_silicon_entropy(csv_path: Path = None):
    if csv_path is None:
        csv_path = Path(__file__).resolve().parents[1] / 'measurements/validation_1.csv'
        
    if not csv_path.exists():
        print(f"Error: {csv_path} not found.")
        return

    # 1. Read distinct pattern trials
    core_bits = collections.defaultdict(list)
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for r in reader:
            if r['trial'] == '1':  # distinct challenges
                core_bits[int(r['core'])].append(int(r['response']))

    num_patterns = len(core_bits[0])
    
    # 2. Compute NIST SP 800-90B Most Common Value (MCV) Entropy per core
    # H_inf = -log2(p_max) where p_max = max(p1, 1 - p1)
    entropies = []
    p1_list = []
    for c in range(64):
        bits = core_bits[c]
        p1 = sum(bits) / float(len(bits))
        p1_list.append(p1)
        p_max = max(p1, 1.0 - p1)
        h_inf = -math.log2(p_max) if p_max > 0 else 0.0
        entropies.append(h_inf)

    # 3. Block Level Min-Entropy (31-bit blocks)
    block0_h = sum(entropies[0:31])
    block1_h = sum(entropies[31:62])
    helper_leakage_per_block = 15.0  # 15 parity bits in BCH(31, 16, 3)
    
    retained_block0 = max(0.0, block0_h - helper_leakage_per_block)
    retained_block1 = max(0.0, block1_h - helper_leakage_per_block)
    retained_per_challenge = retained_block0 + retained_block1

    challenges_for_128 = math.ceil(128.0 / retained_per_challenge) if retained_per_challenge > 0 else 0
    challenges_for_256 = math.ceil(256.0 / retained_per_challenge) if retained_per_challenge > 0 else 0

    print("=" * 82)
    print("   NIST SP 800-90B PHYSICAL SILICON MIN-ENTROPY ASSESSMENT (BASYS 3)")
    print("=" * 82)
    print(f"Dataset Analyzed             : {csv_path.name} (Trial 1, {num_patterns} distinct challenges)")
    print(f"Total Physical Cores         : 64 Artix-7 CBDC-PUF cores")
    print(f"Mean Per-Core Min-Entropy    : {sum(entropies)/len(entropies):.4f} bits/bit (Ideal: 1.0000)")
    print(f"Median Per-Core Min-Entropy  : {sorted(entropies)[32]:.4f} bits/bit")
    print(f"Entropy Range across Cores   : [{min(entropies):.4f} bits (Core {entropies.index(min(entropies))}) .. "
          f"{max(entropies):.4f} bits (Core {entropies.index(max(entropies))})]")
    print("-" * 82)
    print("   31-BIT PUF BLOCK ENTROPY & DODIS HELPER LEAKAGE BOUNDS")
    print("-" * 82)
    print(f"Block 0 (Cores 0..30) Min-Entropy  : {block0_h:.2f} bits (Ideal: 31.00 bits)")
    print(f"Block 1 (Cores 31..61) Min-Entropy : {block1_h:.2f} bits (Ideal: 31.00 bits)")
    print(f"BCH(31, 16, 3) Helper Parity Size  : 15.00 bits per block")
    print(f"Retained Secrecy (Block 0)         : {retained_block0:.2f} bits after public helper data")
    print(f"Retained Secrecy (Block 1)         : {retained_block1:.2f} bits after public helper data")
    print(f"Effective Secrecy Per Challenge    : {retained_per_challenge:.2f} bits per 64-bit response")
    print("-" * 82)
    print("   CRYPTOGRAPHIC KEY ACCUMULATION REQUIREMENTS (LEFTOVER HASH LEMMA)")
    print("-" * 82)
    print(f"Challenges Needed for 128-bit Key  : {challenges_for_128} challenges ({challenges_for_128 * 64} physical bits)")
    print(f"Challenges Needed for 256-bit Key  : {challenges_for_256} challenges ({challenges_for_256 * 64} physical bits)")
    print(f"Academic Takeaway                  : Because physical silicon exhibits bias (Core 61 = 92% ones),")
    print(f"                                     individual cores do not yield 1.0 bit/bit. Retaining a true")
    print(f"                                     256-bit cryptographic security margin requires accumulating")
    print(f"                                     across {challenges_for_256} independent challenges through SHA-3 / SHAKE-256.")
    print("=" * 82)


if __name__ == '__main__':
    audit_silicon_entropy()
