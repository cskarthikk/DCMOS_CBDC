"""Evaluate BCH(31, 16, 3) Error Correction & SHA-3 on Hardware PUF Responses.

Usage:
    python crypto_reconstruct.py --input <capture.csv> [--model <model.json>] [--enrolled-only] [--output <report.json>]
"""

import argparse
import collections
import csv
import json
import sys
from pathlib import Path
from typing import Optional

# Add script directory to sys.path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from crypto_engine import FuzzyExtractor, SHA3ChallengePreprocessor, BCH31_16_3


def evaluate_capture(csv_path: Path, model_path: Optional[Path] = None, enrolled_only: bool = False):
    print(f"Loading capture: {csv_path}")
    
    selected_set = set()
    if enrolled_only and model_path and model_path.exists():
        with open(model_path, 'r', encoding='utf-8') as f:
            m = json.load(f)
        for b in m.get('bits', []):
            if b.get('selected', False):
                selected_set.add((b['pattern'], b['core']))
        print(f"Loaded enrollment mask: {len(selected_set)} selected positions.")

    frames = collections.defaultdict(dict)
    all_patterns = set()
    all_trials = set()
    
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            pat = int(row['pattern'])
            trial = int(row['trial'])
            core = int(row['core'])
            resp = int(row['response'])
            
            if not enrolled_only or (pat, core) in selected_set:
                frames[(pat, trial)][core] = resp
                all_patterns.add(pat)
                all_trials.add(trial)
            
    sorted_patterns = sorted(list(all_patterns))
    sorted_trials = sorted(list(all_trials))
    print(f"Loaded {len(sorted_patterns)} patterns across {len(sorted_trials)} trials.")
    
    # Pack responses into 16-bit blocks
    num_blocks = len(sorted_patterns) // 2
    raw_word_errors = 0
    post_bch_word_errors = 0
    total_evaluations = 0
    max_flips = 0
    error_hist = collections.defaultdict(int)
    
    for b in range(num_blocks):
        p0 = sorted_patterns[2 * b]
        p1 = sorted_patterns[2 * b + 1]
        
        # Reference word from trial 1
        w0_ref = sum(frames[(p0, sorted_trials[0])].get(c, 0) << c for c in range(8))
        w1_ref = sum(frames[(p1, sorted_trials[0])].get(c, 0) << c for c in range(8))
        r_ref = (w1_ref << 8) | w0_ref
        
        # Generate BCH(31, 16, 3) 15-bit Helper Data
        _, helper = FuzzyExtractor.generate(r_ref)
        
        # Test across subsequent trials
        for t in sorted_trials[1:]:
            w0 = sum(frames[(p0, t)].get(c, 0) << c for c in range(8))
            w1 = sum(frames[(p1, t)].get(c, 0) << c for c in range(8))
            r_noisy = (w1 << 8) | w0
            
            diff_bits = bin(r_noisy ^ r_ref).count('1')
            error_hist[diff_bits] += 1
            if diff_bits > max_flips:
                max_flips = diff_bits
                
            if diff_bits > 0:
                raw_word_errors += 1
                
            r_rec, errs, ok = FuzzyExtractor.reproduce(r_noisy, helper)
            if not ok or r_rec != r_ref:
                post_bch_word_errors += 1
                
            total_evaluations += 1
            
    total_bits = total_evaluations * 16 if total_evaluations > 0 else 1
    raw_ber_percent = (sum(k * v for k, v in error_hist.items()) / total_bits) * 100.0
    raw_wer_percent = (raw_word_errors / total_evaluations * 100.0) if total_evaluations else 0.0
    post_bch_wer_percent = (post_bch_word_errors / total_evaluations * 100.0) if total_evaluations else 0.0
    reconstruction_success_percent = (((total_evaluations - post_bch_word_errors) / total_evaluations) * 100.0) if total_evaluations else 0.0
    
    report = {
        'enrolled_only_filter': enrolled_only,
        'total_16bit_words_evaluated': total_evaluations,
        'max_bit_flips_in_word': max_flips,
        'error_distribution_hist': dict(error_hist),
        'raw_bit_error_rate_percent': raw_ber_percent,
        'raw_word_error_rate_percent': raw_wer_percent,
        'post_bch_word_error_rate_percent': post_bch_wer_percent,
        'bch_reconstruction_success_percent': reconstruction_success_percent
    }
    
    mode_str = "ENROLLED CANDIDATE POSITIONS" if enrolled_only else "ALL UNFILTERED RAW RESPONSES"
    print(f"\n================= BCH(31, 16, 3) RECONSTRUCTION REPORT ({mode_str}) =================")
    print(f"Total 16-bit PUF Words Evaluated : {total_evaluations}")
    print(f"Raw Bit Error Rate (BER)         : {raw_ber_percent:.4f}%")
    print(f"Raw Word Error Rate (WER)        : {raw_wer_percent:.2f}% (words with >= 1 bit flip)")
    print(f"Max Bit Flips in any 16-bit word : {max_flips} bits")
    print(f"Error Histogram (bit flips/word) : {dict(error_hist)}")
    print(f"------------------------------------------------------------------------")
    print(f"Word Error Rate AFTER BCH(31,16,3): {post_bch_wer_percent:.4f}%")
    print(f"Cryptographic Key Agreement Rate : {reconstruction_success_percent:.4f}%")
    print("========================================================================\n")
    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="PUF Cryptographic Key Reconstruction Evaluation")
    parser.add_argument('--input', type=Path, required=True, help="Path to capture CSV file")
    parser.add_argument('--model', type=Path, default=Path('CBDC_PUF_MAIN/enrollment/baseline/model.json'), help="Path to baseline model.json")
    parser.add_argument('--enrolled-only', action='store_true', help="Filter to only enrolled stable positions")
    parser.add_argument('--output', type=Path, default=None, help="Optional output JSON report path")
    args = parser.parse_args()
    
    res = evaluate_capture(args.input, args.model, args.enrolled_only)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with open(args.output, 'w', encoding='utf-8') as f:
            json.dump(res, f, indent=2)
        print(f"Saved report to: {args.output}")
