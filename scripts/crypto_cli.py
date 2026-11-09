"""CLI bridge for SHA-3 challenge generation and BCH(31, 16, 3) Fuzzy Extractor.
Supports both 8-core and 64-core architectures.
"""

import argparse
import hashlib
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from crypto_engine import (
    SHA3ChallengePreprocessor, FuzzyExtractor, MultiBlockFuzzyExtractor,
    BCH31_16_3, DodisCodeOffsetFuzzyExtractor, SecureFuzzyExtractor
)


def main():
    parser = argparse.ArgumentParser(description="Cryptographic Engine CLI for CBDC-PUF")
    sub = parser.add_subparsers(dest='action', required=True)
    
    # 1. Generate SHA-3 configurations from string challenge
    p_sha = sub.add_parser('hash_challenge')
    p_sha.add_argument('--challenge', type=str, required=True)
    p_sha.add_argument('--cores', type=int, default=64)
    
    # 2. Cryptographically Secure Dodis Code-Offset Fuzzy Extractor (128-bit / 256-bit key)
    p_sec_gen = sub.add_parser('enroll_secure')
    p_sec_gen.add_argument('--responses64', type=lambda x: [int(v, 0) for v in x.split(',')], required=True,
                           help="Comma-separated 64-bit physical responses (e.g. 8 challenges for 256-bit key)")
    p_sec_gen.add_argument('--bits', type=int, default=256, choices=[128, 256],
                           help="Master key size in bits (128 or 256)")
                           
    p_sec_rec = sub.add_parser('reconstruct_secure')
    p_sec_rec.add_argument('--noisy64', type=lambda x: [int(v, 0) for v in x.split(',')], required=True,
                           help="Comma-separated 64-bit noisy responses")
    p_sec_rec.add_argument('--helpers31', type=lambda x: [int(v, 0) for v in x.split(',')], required=True,
                           help="Comma-separated 31-bit helper data values")
    p_sec_rec.add_argument('--bits', type=int, default=256, choices=[128, 256])
    
    # 3. 16-bit key operations (8-core legacy mode)
    p_gen16 = sub.add_parser('enroll_key')
    p_gen16.add_argument('--response16', type=lambda x: int(x, 0), required=True)
    
    p_rec16 = sub.add_parser('reconstruct_key')
    p_rec16.add_argument('--noisy16', type=lambda x: int(x, 0), required=True)
    p_rec16.add_argument('--helper15', type=lambda x: int(x, 0), required=True)
    
    # 4. 64-bit key operations (Legacy Paper Section 4.1 Channel ECC mode)
    p_gen64 = sub.add_parser('enroll_key64')
    p_gen64.add_argument('--response64', type=lambda x: int(x, 0), required=True)
    
    p_rec64 = sub.add_parser('reconstruct_key64')
    p_rec64.add_argument('--noisy64', type=lambda x: int(x, 0), required=True)
    p_rec64.add_argument('--helpers15', type=lambda x: [int(v, 0) for v in x.split(',')], required=True,
                         help="Comma-separated list of 4 15-bit helper values, e.g. 0x1234,0x5678,0x9abc,0xdef0")

    args = parser.parse_args()
    
    if args.action == 'enroll_secure':
        master_key, helpers, secrets_list = SecureFuzzyExtractor.generate(args.responses64, target_key_bits=args.bits)
        print(json.dumps({
            'mode': 'Dodis_Code_Offset_Secure_Fuzzy_Extractor',
            'key_bits': args.bits,
            'entropy_bits': args.bits,
            'master_key_hex': master_key.hex(),
            'helpers_count': len(helpers),
            'helpers31_hex': [f"0x{h:08X}" for h in helpers],
            'helpers31_csv': ",".join(f"0x{h:08X}" for h in helpers),
            'secrets16_hex': [f"0x{s:04X}" for s in secrets_list]
        }, indent=2))
        
    elif args.action == 'reconstruct_secure':
        master_key, total_errs, ok = SecureFuzzyExtractor.reproduce(args.noisy64, args.helpers31, target_key_bits=args.bits)
        print(json.dumps({
            'mode': 'Dodis_Code_Offset_Secure_Fuzzy_Extractor',
            'key_bits': args.bits,
            'reconstructed_key_hex': master_key.hex() if ok else "",
            'errors_corrected': total_errs,
            'success': ok
        }, indent=2))
        
    elif args.action == 'hash_challenge':
        seed_bytes = args.challenge.encode('utf-8')
        cfgs = SHA3ChallengePreprocessor.hash_challenge(seed_bytes, num_cores=args.cores)
        sha_hex = hashlib.sha3_256(seed_bytes).hexdigest()
        print(json.dumps({
            'challenge_input': args.challenge,
            'cores': args.cores,
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
        
    elif args.action == 'enroll_key64':
        r_ref, helpers = MultiBlockFuzzyExtractor.generate(args.response64, total_bits=64)
        print(json.dumps({
            'reference_key_hex': f"0x{r_ref:016X}",
            'reference_key_bin': f"{r_ref:064b}",
            'helpers_data_hex': [f"0x{h:04X}" for h in helpers],
            'helpers_data_csv': ",".join(f"0x{h:04X}" for h in helpers)
        }))
        
    elif args.action == 'reconstruct_key64':
        r_rec, errs, ok = MultiBlockFuzzyExtractor.reproduce(args.noisy64, args.helpers15, total_bits=64)
        print(json.dumps({
            'noisy_response_hex': f"0x{args.noisy64:016X}",
            'noisy_response_bin': f"{args.noisy64:064b}",
            'reconstructed_key_hex': f"0x{r_rec:016X}",
            'reconstructed_key_bin': f"{r_rec:064b}",
            'bit_errors_corrected': errs,
            'reconstruction_success': ok
        }))


if __name__ == '__main__':
    main()
