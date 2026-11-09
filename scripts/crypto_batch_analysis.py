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
from crypto_engine import (
    SHA3ChallengePreprocessor, FuzzyExtractor, MultiBlockFuzzyExtractor,
    BCH31_16_3, DodisCodeOffsetFuzzyExtractor, SecureFuzzyExtractor
)


def analyze_batch(results_data: dict, output_path: Path = None):
    items = results_data.get('challenges', [])
    num_challenges = len(items)
    if num_challenges == 0:
        print("No challenges to analyze.")
        return

    # Auto-detect key width (16-bit vs 64-bit)
    if 'key_bits' in results_data:
        key_bits = int(results_data['key_bits'])
    elif len(items) > 0 and (isinstance(items[0].get('helper_data'), list) or items[0].get('enrolled_key', 0) > 0xFFFF):
        key_bits = 64
    else:
        key_bits = 16

    # 1. Intra-Challenge Analysis (Stability & BCH Correction)
    total_evals = 0
    raw_flips_total = 0
    raw_word_errors = 0
    post_bch_word_errors = 0
    code_offset_word_errors = 0
    flips_hist = collections.defaultdict(int)
    reconstructed_keys = []

    for c in items:
        ref_key = c['enrolled_key']
        helper = c.get('helper_data', [])
        reconstructed_keys.append(ref_key)
        
        # Prepare Code-Offset enrollment if 64-bit
        if key_bits == 64:
            b0_ref = ref_key & 0x7FFFFFFF
            b1_ref = (ref_key >> 31) & 0x7FFFFFFF
            s0, h0 = DodisCodeOffsetFuzzyExtractor.generate(b0_ref)
            s1, h1 = DodisCodeOffsetFuzzyExtractor.generate(b1_ref)

        for q in c['live_queries']:
            noisy = q['noisy_response']
            diff = bin(noisy ^ ref_key).count('1')
            flips_hist[diff] += 1
            raw_flips_total += diff
            if diff > 0:
                raw_word_errors += 1
            
            # Legacy evaluation
            if key_bits == 64:
                rec_key, errs, ok = MultiBlockFuzzyExtractor.reproduce(noisy, helper, total_bits=64)
                # Code-Offset evaluation on same physical query
                nb0 = noisy & 0x7FFFFFFF
                nb1 = (noisy >> 31) & 0x7FFFFFFF
                r0, e0, ok0 = DodisCodeOffsetFuzzyExtractor.reproduce(nb0, h0)
                r1, e1, ok1 = DodisCodeOffsetFuzzyExtractor.reproduce(nb1, h1)
                if not (ok0 and ok1) or r0 != s0 or r1 != s1:
                    code_offset_word_errors += 1
            else:
                rec_key, errs, ok = FuzzyExtractor.reproduce(noisy, helper)

            if not ok or rec_key != ref_key:
                post_bch_word_errors += 1
            total_evals += 1

    raw_ber_pct = (raw_flips_total / (total_evals * key_bits)) * 100.0 if total_evals else 0.0
    raw_wer_pct = (raw_word_errors / total_evals) * 100.0 if total_evals else 0.0
    post_bch_wer_pct = (post_bch_word_errors / total_evals) * 100.0 if total_evals else 0.0
    key_agreement_pct = ((total_evals - post_bch_word_errors) / total_evals) * 100.0 if total_evals else 0.0
    co_agreement_pct = ((total_evals - code_offset_word_errors) / total_evals) * 100.0 if total_evals else 0.0

    # 2. Inter-Challenge Uniqueness (Fractional Hamming Distance)
    # Between all pairs of distinct enrolled keys: sum(HD(Ki, Kj)) / (key_bits * C(N, 2))
    pair_hds = []
    for k1, k2 in itertools.combinations(reconstructed_keys, 2):
        hd = bin(k1 ^ k2).count('1')
        pair_hds.append(hd / float(key_bits))

    mean_uniqueness_pct = (sum(pair_hds) / len(pair_hds)) * 100.0 if pair_hds else 0.0
    min_uniqueness_pct = (min(pair_hds) * 100.0) if pair_hds else 0.0
    max_uniqueness_pct = (max(pair_hds) * 100.0) if pair_hds else 0.0

    # 3. Overall Bit Randomness / Ones Percentage across Enrolled Keys
    total_key_bits = num_challenges * key_bits
    total_key_ones = sum(bin(k).count('1') for k in reconstructed_keys)
    ones_pct = (total_key_ones / total_key_bits) * 100.0 if total_key_bits else 0.0

    report = {
        'key_bits': key_bits,
        'num_challenges': num_challenges,
        'total_live_queries': total_evals,
        'ones_percentage': ones_pct,
        'raw_bit_error_rate_percent': raw_ber_pct,
        'raw_word_error_rate_percent': raw_wer_pct,
        'post_bch_word_error_rate_percent': post_bch_wer_pct,
        'cryptographic_key_agreement_percent': key_agreement_pct,
        'code_offset_key_agreement_percent': co_agreement_pct if key_bits == 64 else None,
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
    print(f"Legacy Mode Key Reconstruction Agreement: {key_agreement_pct:.4f}%")
    if key_bits == 64:
        print(f"Code-Offset Secure Key Agreement Rate   : {co_agreement_pct:.4f}% (Dodis et al. 2008)")
    print("=" * 76 + "\n")

    if output_path:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(report, f, indent=2)
        print(f"Saved JSON report to: {output_path}")

    return report


def analyze_validation_csvs(csv1_path: Path, csv2_path: Path, output_path: Path = None):
    """Evaluates 64-core error correction across independent hardware captures."""
    import csv

    def load_words(path):
        meta = json.loads(Path(str(path)+'.metadata.json').read_text(encoding='utf-8-sig'))
        matrix = json.loads(Path(str(path)+'.challenges.json').read_text(encoding='utf-8-sig'))
        if meta.get('cores') != 64 or meta.get('variant') != 'paper_array64_and_ce':
            raise ValueError('Expected complete 64-core raw capture')
        patterns, repeats = meta['patterns'], meta['repeats']
        if repeats < 1 or len(matrix) != patterns:
            raise ValueError('Invalid capture dimensions')
        words = collections.defaultdict(lambda: collections.defaultdict(dict))
        frame_words = {}
        count = 0
        with path.open(newline='', encoding='utf-8-sig') as f:
            for r in csv.DictReader(f):
                p,t,c,b = (int(r[k]) for k in ('pattern','trial','core','response'))
                if not (0<=p<patterns and 1<=t<=repeats and 0<=c<64 and b in (0,1)):
                    raise ValueError('Invalid observation index or response')
                if c in words[p][t]: raise ValueError('Duplicate observation')
                if r['flags_hex'] != '61' or r['variant'] != meta['variant'] or r['mode'] != meta['mode'] or int(r['excite_cycles']) != meta['excite_cycles']:
                    raise ValueError('Capture status/profile mismatch')
                if int(r['challenge_hex'],16) != matrix[p]['challenges'][c]:
                    raise ValueError('Configuration differs from frozen matrix')
                w = int(r['response_word_hex'],16)
                if not (0<=w<2**64) or ((w>>c)&1)!=b or frame_words.setdefault((p,t),w)!=w:
                    raise ValueError('Inconsistent response word')
                words[p][t][c] = b
                count += 1
        if count != patterns*repeats*64:
            raise ValueError('Incomplete capture')
        metadata.append((meta,matrix))
        t1_map = {}
        maj_map = {}
        for p in words:
            w_t1 = sum(words[p][1][c] << c for c in range(64))
            t1_map[p] = w_t1
            w_maj = 0
            for c in range(64):
                votes = sum(words[p][t][c] for t in words[p])
                if votes >= len(words[p]) / 2.0:
                    w_maj |= (1 << c)
            maj_map[p] = w_maj
        return t1_map, maj_map

    print("\nLoading physical validation captures...")
    metadata = []
    t1_1, maj_1 = load_words(csv1_path)
    t1_2, maj_2 = load_words(csv2_path)
    if metadata[0][1] != metadata[1][1] or any(metadata[0][0][k] != metadata[1][0][k] for k in ('sha256','mode','excite_cycles','patterns','repeats')):
        raise ValueError('Enrollment and evaluation use different matrices or profiles')
    num_patterns = len(t1_1)

    # 1. Single Trial Evaluation (No Majority Voting)
    single_raw_flips = 0
    single_legacy_fails = 0
    single_co_fails = 0

    # 2. Majority Voted Evaluation (20-Trial Filtered)
    maj_raw_flips = 0
    maj_legacy_fails = 0
    maj_co_fails = 0

    for p in range(num_patterns):
        # --- Single Trial ---
        r1 = t1_1[p]
        r2 = t1_2[p]
        diff1 = bin(r1 ^ r2).count('1')
        single_raw_flips += diff1

        # Legacy
        _, h_legacy = MultiBlockFuzzyExtractor.generate(r1, total_bits=64)
        rec_leg, _, ok_leg = MultiBlockFuzzyExtractor.reproduce(r2, h_legacy, total_bits=64)
        if not ok_leg or rec_leg != r1:
            single_legacy_fails += 1

        # Code-Offset
        b0_ref, b1_ref = r1 & 0x7FFFFFFF, (r1 >> 31) & 0x7FFFFFFF
        s0, h0 = DodisCodeOffsetFuzzyExtractor.generate(b0_ref)
        s1, h1 = DodisCodeOffsetFuzzyExtractor.generate(b1_ref)
        nb0, nb1 = r2 & 0x7FFFFFFF, (r2 >> 31) & 0x7FFFFFFF
        rec0, _, ok0 = DodisCodeOffsetFuzzyExtractor.reproduce(nb0, h0)
        rec1, _, ok1 = DodisCodeOffsetFuzzyExtractor.reproduce(nb1, h1)
        if not (ok0 and ok1) or rec0 != s0 or rec1 != s1:
            single_co_fails += 1

        # --- Majority Voting ---
        m1 = maj_1[p]
        m2 = maj_2[p]
        diff_maj = bin(m1 ^ m2).count('1')
        maj_raw_flips += diff_maj

        _, h_maj_leg = MultiBlockFuzzyExtractor.generate(m1, total_bits=64)
        rec_mleg, _, ok_mleg = MultiBlockFuzzyExtractor.reproduce(m2, h_maj_leg, total_bits=64)
        if not ok_mleg or rec_mleg != m1:
            maj_legacy_fails += 1

        mb0_ref, mb1_ref = m1 & 0x7FFFFFFF, (m1 >> 31) & 0x7FFFFFFF
        ms0, mh0 = DodisCodeOffsetFuzzyExtractor.generate(mb0_ref)
        ms1, mh1 = DodisCodeOffsetFuzzyExtractor.generate(mb1_ref)
        mnb0, mnb1 = m2 & 0x7FFFFFFF, (m2 >> 31) & 0x7FFFFFFF
        mrec0, _, mok0 = DodisCodeOffsetFuzzyExtractor.reproduce(mnb0, mh0)
        mrec1, _, mok1 = DodisCodeOffsetFuzzyExtractor.reproduce(mnb1, mh1)
        if not (mok0 and mok1) or mrec0 != ms0 or mrec1 != ms1:
            maj_co_fails += 1

    total_bits = num_patterns * 64
    single_ber = (single_raw_flips / total_bits) * 100.0
    maj_ber = (maj_raw_flips / total_bits) * 100.0

    print("=" * 82)
    print("   64-CORE HARDWARE VALIDATION SWEEP: LEGACY ECC vs DODIS CODE-OFFSET")
    print("=" * 82)
    print(f"Dataset 1 (Enrollment)       : {csv1_path.name} (256 patterns x 64 cores x 20 trials)")
    print(f"Dataset 2 (Verification)     : {csv2_path.name} (256 patterns x 64 cores x 20 trials)")
    print(f"Total Physical Patterns      : {num_patterns} patterns (16,384 physical bits per capture)")
    print("-" * 82)
    print("   ERROR-CORRECTION PERFORMANCE COMPARISON")
    print("-" * 82)
    print(f"Mode 1: Single Trial Raw (No Majority Voting)")
    print(f"  Raw Silicon BER            : {single_ber:.4f}% ({single_raw_flips} bit flips / {total_bits})")
    print(f"  Legacy Parity Scheme       : Key Agreement = {(num_patterns - single_legacy_fails)/num_patterns*100:.2f}% (WER = {single_legacy_fails/num_patterns*100:.2f}%)")
    print(f"  Dodis Code-Offset Extractor: Key Agreement = {(num_patterns - single_co_fails)/num_patterns*100:.2f}% (WER = {single_co_fails/num_patterns*100:.2f}%)")
    print(f"Mode 2: 20-Trial Majority Voting (Temporal Filtered)")
    print(f"  Raw Silicon BER            : {maj_ber:.4f}% ({maj_raw_flips} residual bit flips)")
    print(f"  Legacy Parity Scheme       : Key Agreement = {(num_patterns - maj_legacy_fails)/num_patterns*100:.4f}% (WER = {maj_legacy_fails/num_patterns*100:.4f}%)")
    print(f"  Dodis Code-Offset Extractor: Key Agreement = {(num_patterns - maj_co_fails)/num_patterns*100:.4f}% (WER = {maj_co_fails/num_patterns*100:.4f}%)")
    print("-" * 82)
    print(f"Observed voted code-offset recovery: {num_patterns-maj_co_fails}/{num_patterns} ({100*(1-maj_co_fails/num_patterns):.4f}%).")
    print("Scope: two 31-bit response blocks; cores 62 and 63 excluded. Ties vote one.")
    print("This measures reconstruction, not conditional entropy or complete master-key security.")
    print("=" * 82)

    report = {
        'num_patterns': num_patterns,
        'single_trial': {
            'raw_ber_pct': single_ber,
            'legacy_key_agreement_pct': (num_patterns - single_legacy_fails)/num_patterns*100,
            'code_offset_key_agreement_pct': (num_patterns - single_co_fails)/num_patterns*100
        },
        'majority_voting': {
            'raw_ber_pct': maj_ber,
            'legacy_key_agreement_pct': (num_patterns - maj_legacy_fails)/num_patterns*100,
            'code_offset_key_agreement_pct': (num_patterns - maj_co_fails)/num_patterns*100
        }
    }

    if output_path:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(report, f, indent=2)
        print(f"Saved JSON report to: {output_path}")

    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Multi-Challenge Batch Analysis")
    parser.add_argument('--input', type=Path, default=None, help="Input raw sweep JSON file")
    parser.add_argument('--csv1', type=Path, default=None, help="First validation CSV (e.g. measurements/validation_1.csv)")
    parser.add_argument('--csv2', type=Path, default=None, help="Second validation CSV (e.g. measurements/validation_2.csv)")
    parser.add_argument('--output', type=Path, default=None, help="Output summary report JSON")
    args = parser.parse_args()

    if args.csv1 and args.csv2:
        analyze_validation_csvs(args.csv1, args.csv2, args.output)
    elif args.input:
        with open(args.input, 'r', encoding='utf-8-sig') as f:
            data = json.load(f)
        analyze_batch(data, args.output)
    else:
        # Default fallback to validation_1.csv and validation_2.csv if they exist
        p1 = Path('measurements/validation_1.csv')
        p2 = Path('measurements/validation_2.csv')
        if p1.exists() and p2.exists():
            analyze_validation_csvs(p1, p2, args.output)
        else:
            parser.error("Either --input <json> or --csv1 <csv> and --csv2 <csv> must be provided.")

