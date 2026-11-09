#!/usr/bin/env python3
"""NIST SP 800-90B Physical Silicon Min-Entropy & Secrecy Assessment.

Calculates the empirical min-entropy of the 64 physical CBDC-PUF cores on the
Digilent Basys 3 FPGA using measurements/validation_1.csv.

Methodology:
  1. Most Common Value (MCV) Min-Entropy per core (NIST SP 800-90B Section 6.3.1).
     Evaluates both the raw sample estimate H_inf and the NIST 99% confidence
     upper-bound adjusted estimate H_inf,99%.
  2. Block Min-Entropy for 31-bit PUF segments (Blocks 0 and 1).
     CRITICAL ACADEMIC NOTE: Summing marginal entropies across cores represents
     an upper bound that assumes mutual spatial independence among cores.
  3. Secrecy Retention after publishing 15-bit BCH(31, 16, 3) helper data (Dodis Lemma 1).
  4. Analysis of live demo key derivation vs theoretical joint entropy bounds.

References:
  - NIST Special Publication 800-90B: "Recommendation for the Entropy Sources
    Used for Random Bit Generation", Section 6.3.1 (Most Common Value Estimate).
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

    L = len(core_bits[0])  # Sample size (256 patterns)
    z = 2.576  # 99% confidence z-score (NIST SP 800-90B Section 6.3.1)
    
    # 2. Compute NIST SP 800-90B Most Common Value (MCV) Entropy per core
    raw_entropies = []
    nist_entropies = []
    p1_list = []
    
    for c in range(64):
        bits = core_bits[c]
        p1 = sum(bits) / float(L)
        p1_list.append(p1)
        p_hat = max(p1, 1.0 - p1)
        
        # Raw point estimate
        raw_h = -math.log2(p_hat) if p_hat > 0 else 0.0
        raw_entropies.append(raw_h)
        
        # NIST SP 800-90B Section 6.3.1 with 99% confidence bound
        if p_hat < 1.0 and L > 1:
            margin = z * math.sqrt((p_hat * (1.0 - p_hat)) / (L - 1))
            p_u = min(1.0, p_hat + margin)
        else:
            p_u = 1.0
        nist_h = -math.log2(p_u) if p_u > 0 else 0.0
        nist_entropies.append(nist_h)

    # 3. Block-Level Min-Entropy under Independence Assumption (Upper Bound)
    block0_raw = sum(raw_entropies[0:31])
    block1_raw = sum(raw_entropies[31:62])
    block0_nist = sum(nist_entropies[0:31])
    block1_nist = sum(nist_entropies[31:62])
    
    helper_leakage_per_block = 15.0  # 15 parity bits in BCH(31, 16, 3)
    
    retained_b0_raw = max(0.0, block0_raw - helper_leakage_per_block)
    retained_b1_raw = max(0.0, block1_raw - helper_leakage_per_block)
    retained_raw_per_ch = retained_b0_raw + retained_b1_raw
    
    retained_b0_nist = max(0.0, block0_nist - helper_leakage_per_block)
    retained_b1_nist = max(0.0, block1_nist - helper_leakage_per_block)
    retained_nist_per_ch = retained_b0_nist + retained_b1_nist

    print("=" * 84)
    print("   NIST SP 800-90B PHYSICAL SILICON MIN-ENTROPY ASSESSMENT (BASYS 3)")
    print("=" * 84)
    print(f"Dataset Analyzed             : {csv_path.name} (Trial 1, {L} distinct challenges)")
    print(f"Total Physical Cores         : 64 Artix-7 CBDC-PUF cores")
    print(f"Raw Sample Min-Entropy       : Mean = {sum(raw_entropies)/64:.4f} bits/core (Median: {sorted(raw_entropies)[32]:.4f})")
    print(f"NIST 99% Conf. Min-Entropy   : Mean = {sum(nist_entropies)/64:.4f} bits/core (Median: {sorted(nist_entropies)[32]:.4f})")
    print(f"Per-Core Range (NIST 99%)    : [{min(nist_entropies):.4f} bits (Core {nist_entropies.index(min(nist_entropies))}) .. "
          f"{max(nist_entropies):.4f} bits (Core {nist_entropies.index(max(nist_entropies))})]")
    print("-" * 84)
    print("   31-BIT BLOCK ENTROPY & DODIS HELPER LEAKAGE (UNDER INDEPENDENCE ASSUMPTION)")
    print("-" * 84)
    print(f"Block 0 (Cores 0..30)  : Raw Sum = {block0_raw:.2f} bits | NIST 99% Sum = {block0_nist:.2f} bits (Ideal: 31.0)")
    print(f"Block 1 (Cores 31..61) : Raw Sum = {block1_raw:.2f} bits | NIST 99% Sum = {block1_nist:.2f} bits (Ideal: 31.0)")
    print(f"BCH(31, 16, 3) Helper Parity : 15.00 bits published per block (Dodis Lemma 1 leakage)")
    print(f"Retained Secrecy (Raw) : Block 0 = {retained_b0_raw:.2f} bits | Block 1 = {retained_b1_raw:.2f} bits -> Total: {retained_raw_per_ch:.2f} bits/ch")
    print(f"Retained Secrecy (NIST): Block 0 = {retained_b0_nist:.2f} bits | Block 1 = {retained_b1_nist:.2f} bits -> Total: {retained_nist_per_ch:.2f} bits/ch")
    print("-" * 84)
    print("   SCIENTIFIC EVALUATION & CRYPTOGRAPHIC LIMITATIONS")
    print("-" * 84)
    print("1. INDEPENDENCE CAVEAT: Summing marginal core entropies assumes spatial independence.")
    print("   Because real FPGA cores share power distribution networks and die substrate,")
    print("   true joint min-entropy H_inf(C0..C30) may be less than the marginal sum.")
    print("2. LIVE DEMO REALITY: The live demo (`crypto_demo.ps1`) uses 8 challenges,")
    print("   accumulating 16 nominal 16-bit random secrets (256 nominal key bits).")
    print("   This serves as an operational proof-of-concept for the Dodis code-offset")
    print("   protocol, but does NOT mathematically prove 256 bits of independent physical")
    print("   silicon entropy.")
    print("3. CONCLUSION: The code-offset scheme eliminates the direct 16-candidate exploit")
    print("   present in the legacy parity scheme. However, rigorous quantification of retained")
    print("   physical entropy and inter-challenge correlation remains an open research topic.")
    print("=" * 84)


if __name__ == '__main__':
    audit_silicon_entropy()
