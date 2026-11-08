"""CLI bridge for SHA-3 challenge generation and BCH(31, 16, 3) Fuzzy Extractor.
"""

import argparse
import hashlib
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from crypto_engine import SHA3ChallengePreprocessor, FuzzyExtractor, BCH31_16_3


def main():
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest='action', required=True)
    
    # 1. Generate SHA-3 configurations from string challenge
    p_sha = sub.add_parser('hash_challenge')
    p_sha.add_argument('--challenge', type=str, required=True)
    p_sha.add_argument('--cores', type=int, default=8)
    
    # 2. Generate BCH helper data from enrolled 16-bit response
    p_gen = sub.add_parser('enroll_key')
    p_gen.add_argument('--response16', type=lambda x: int(x, 0), required=True)
    
    # 3. Reconstruct key from noisy 16-bit response and 15-bit helper data
    p_rec = sub.add_parser('reconstruct_key')
    p_rec.add_argument('--noisy16', type=lambda x: int(x, 0), required=True)
    p_rec.add_argument('--helper15', type=lambda x: int(x, 0), required=True)
    
    args = parser.parse_args()
    
    if args.action == 'hash_challenge':
        seed_bytes = args.challenge.encode('utf-8')
        cfgs = SHA3ChallengePreprocessor.hash_challenge(seed_bytes, num_cores=args.cores)
        sha_hex = hashlib.sha3_256(seed_bytes).hexdigest()
        print(json.dumps({
            'challenge_input': args.challenge,
            'sha3_256_digest': sha_hex,
            'configurations_hex': [f"0x{c:04X}" for c in cfgs],
            'configurations_int': cfgs
        }))
        
    elif args.action == 'enroll_key':
        r_ref, helper = FuzzyExtractor.generate(args.response16)
        print(json.dumps({
            'reference_key_hex': f"0x{r_ref:04X}",
            'reference_key_bin': f"{r_ref:016b}",
            'helper_data_hex': f"0x{helper:04X}",
            'helper_data_bin': f"{helper:015b}"
        }))
        
    elif args.action == 'reconstruct_key':
        r_rec, errs, ok = FuzzyExtractor.reproduce(args.noisy16, args.helper15)
        print(json.dumps({
            'noisy_response_hex': f"0x{args.noisy16:04X}",
            'noisy_response_bin': f"{args.noisy16:016b}",
            'reconstructed_key_hex': f"0x{r_rec:04X}",
            'reconstructed_key_bin': f"{r_rec:016b}",
            'bit_errors_corrected': errs,
            'reconstruction_success': ok
        }))


if __name__ == '__main__':
    main()

