"""Multi-Challenge Batch Analysis for CBDC-PUF Cryptographic Pipeline.

Evaluates:
  1. Inter-Challenge Uniqueness (Hamming Distance between different PUF keys)
  2. Intra-Challenge Stability / Bit Error Rate before and after BCH(31, 16, 3)
  3. Bit Distribution / Ones Percentage across challenge space
  4. BCH Error Correction Yield
"""

import argparse
import collections
import itertools
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from crypto_engine import SHA3ChallengePreprocessor, FuzzyExtractor, BCH31_16_3


def analyze_batch(results_data: dict, output_path: Path = None):
    items = results_data.get('challenges', [])
    num_challenges = len(items)
    if num_challenges == 0:
        print("No challenges to analyze.")
        return

    # 1. Intra-Challenge Analysis (Stability & BCH Correction)
    total_evals = 0
    raw_flips_total = 0
    raw_word_errors = 0
    post_bch_word_errors = 0
    flips_hist = collections.defaultdict(int)
    reconstructed_keys = []

    for c in items:
        ref_key = c['enrolled_key']
        helper = c['helper_data']
        reconstructed_keys.append(ref_key)
        
        for q in c['live_queries']:
            noisy = q['noisy_response']
            diff = bin(noisy ^ ref_key).count('1')
            flips_hist[diff] += 1
            raw_flips_total += diff
            if diff > 0:
                raw_word_errors += 1
            
            rec_key, errs, ok = FuzzyExtractor.reproduce(noisy, helper)
            if not ok or rec_key != ref_key:
                post_bch_word_errors += 1
            total_evals += 1

    raw_ber_pct = (raw_flips_total / (total_evals * 16)) * 100.0 if total_evals else 0.0
    raw_wer_pct = (raw_word_errors / total_evals) * 100.0 if total_evals else 0.0
    post_bch_wer_pct = (post_bch_word_errors / total_evals) * 100.0 if total_evals else 0.0
    key_agreement_pct = ((total_evals - post_bch_word_errors) / total_evals) * 100.0 if total_evals else 0.0

    # 2. Inter-Challenge Uniqueness (Fractional Hamming Distance)
    # Between all pairs of distinct enrolled keys: sum(HD(Ki, Kj)) / (16 * C(N, 2))
    pair_hds = []
    for k1, k2 in itertools.combinations(reconstructed_keys, 2):
        hd = bin(k1 ^ k2).count('1')
        pair_hds.append(hd / 16.0)

    mean_uniqueness_pct = (sum(pair_hds) / len(pair_hds)) * 100.0 if pair_hds else 0.0
    min_uniqueness_pct = (min(pair_hds) * 100.0) if pair_hds else 0.0
    max_uniqueness_pct = (max(pair_hds) * 100.0) if pair_hds else 0.0

    # 3. Overall Bit Randomness / Ones Percentage across Enrolled Keys
    total_key_bits = num_challenges * 16
    total_key_ones = sum(bin(k).count('1') for k in reconstructed_keys)
    ones_pct = (total_key_ones / total_key_bits) * 100.0 if total_key_bits else 0.0

    report = {
        'num_challenges': num_challenges,
        'total_live_queries': total_evals,
        'ones_percentage': ones_pct,
        'raw_bit_error_rate_percent': raw_ber_pct,
        'raw_word_error_rate_percent': raw_wer_pct,
        'post_bch_word_error_rate_percent': post_bch_wer_pct,
        'cryptographic_key_agreement_percent': key_agreement_pct,
        'inter_challenge_uniqueness_percent': mean_uniqueness_pct,
        'min_inter_challenge_uniqueness_percent': min_uniqueness_pct,
        'max_inter_challenge_uniqueness_percent': max_uniqueness_pct,
        'error_flips_histogram': dict(flips_hist)
    }

    print("\n" + "=" * 76)
    print("      MULTI-CHALLENGE ROBUSTNESS, UNIQUENESS & BCH ANALYSIS REPORT     ")
    print("      Reference Paper: Liu et al. (ACM TODAES 2023) Section 4.2        ")
    print("=" * 76)
    print(f"Total Distinct Challenges Evaluated : {num_challenges}")
    print(f"Total Live FPGA Queries             : {total_evals}")
    print(f"----------------------------------------------------------------------------")
    print(f"Bit Randomness (Ones Ratio across Keys) : {ones_pct:.2f}% (Ideal: 50.0%)")
    print(f"Inter-Challenge Uniqueness (Mean HD)   : {mean_uniqueness_pct:.2f}% (Ideal: 50.0%)")
    print(f"Uniqueness Range [Min .. Max]           : [{min_uniqueness_pct:.1f}% .. {max_uniqueness_pct:.1f}%]")
    print(f"----------------------------------------------------------------------------")
    print(f"Raw Silicon Bit Error Rate (BER)        : {raw_ber_pct:.4f}%")
    print(f"Raw Word Error Rate (WER before BCH)    : {raw_wer_pct:.2f}% (words with >= 1 error)")
    print(f"Live Error Flip Histogram (flips/word)  : {dict(flips_hist)}")
    print(f"----------------------------------------------------------------------------")
    print(f"Word Error Rate AFTER BCH(31, 16, 3)    : {post_bch_wer_pct:.4f}%")
    print(f"Post-BCH Key Reconstruction Agreement   : {key_agreement_pct:.4f}%")
    print("=" * 76 + "\n")

    if output_path:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(report, f, indent=2)
        print(f"Saved JSON report to: {output_path}")

    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Multi-Challenge Batch Analysis")
    parser.add_argument('--input', type=Path, required=True, help="Input raw sweep JSON file")
    parser.add_argument('--output', type=Path, default=None, help="Output summary report JSON")
    args = parser.parse_args()

    with open(args.input, 'r', encoding='utf-8-sig') as f:
        data = json.load(f)

    analyze_batch(data, args.output)

