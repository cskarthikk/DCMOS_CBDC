"""Machine Learning Modeling Attack Evaluation for CBDC-PUF.
Replicates Section 3.2, Section 4.3, Figure 9, and Table 3 of:
  Yanjiang Liu et al., "CBDC-PUF: A Novel Physical Unclonable Function Design
  Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"
  ACM TODAES, Vol. 28, No. 5, Article 78, Sept 2023.

Evaluates:
  1. SVM (Support Vector Machine) with RBF kernel
  2. RBFNN (Radial Basis Function Neural Network / MLP)
  3. GRNN (Generalized Regression Neural Network, Specht 1991)

Dual Evaluation Engine:
  - Hardware Mode: Evaluates ML attacks on authentic physical CRPs from the Digilent Basys 3 FPGA.
  - Simulation Mode: Replicates Liu et al. Table 3 & Eq. 4 theoretical delay modeling attacks
    (comparing protected SHA-3 preprocessing vs unprotected raw delay lines).
"""

import argparse
import csv
import hashlib
import json
import math
import os
import random
import sys
import time
from pathlib import Path
from typing import Dict, List, Tuple

# Add scripts directory for crypto_engine
sys.path.insert(0, str(Path(__file__).resolve().parent))
from crypto_engine import SHA3ChallengePreprocessor

# Check for scikit-learn
HAVE_SKLEARN = False
try:
    import numpy as np
    from scipy.spatial.distance import cdist
    from sklearn.metrics import accuracy_score
    from sklearn.model_selection import train_test_split
    from sklearn.neural_network import MLPClassifier
    from sklearn.svm import SVC
    HAVE_SKLEARN = True
except ImportError:
    HAVE_SKLEARN = False


# =============================================================================
# PURE-PYTHON MACHINE LEARNING ENGINE (Standard Library Fallback)
# =============================================================================

class PurePythonGRNN:
    """Generalized Regression Neural Network (Specht, IEEE T-NN 1991)."""
    def __init__(self, sigma: float = 0.4, max_kernel_samples: int = 400):
        self.sigma = sigma
        self.max_kernel_samples = max_kernel_samples
        self.X_train = []
        self.y_train = []

    def fit(self, X: List[List[float]], y: List[int]):
        self.X_train = X
        self.y_train = y

    def predict(self, X_test: List[List[float]]) -> List[int]:
        preds = []
        two_sigma_sq = 2.0 * (self.sigma ** 2)
        ref_X = self.X_train[:self.max_kernel_samples]
        ref_y = self.y_train[:self.max_kernel_samples]
        for x in X_test:
            top = 0.0
            bot = 0.0
            for xt, yt in zip(ref_X, ref_y):
                d_sq = sum((a - b) * (a - b) for a, b in zip(x, xt))
                w = math.exp(-d_sq / two_sigma_sq)
                top += w * yt
                bot += w
            prob = top / (bot + 1e-12)
            preds.append(1 if prob >= 0.5 else 0)
        return preds


class PurePythonRBFNN:
    """Multi-Layer Perceptron / RBF Neural Network."""
    def __init__(self, hidden: int = 16, lr: float = 0.08, epochs: int = 25):
        self.hidden = hidden
        self.lr = lr
        self.epochs = epochs
        self.W1 = []
        self.b1 = []
        self.W2 = []
        self.b2 = 0.0
        self.loss_history = []

    def fit(self, X: List[List[float]], y: List[int]):
        rng = random.Random(2026)
        n_feat = len(X[0])
        scale1 = math.sqrt(2.0 / n_feat)
        self.W1 = [[rng.gauss(0, scale1) for _ in range(self.hidden)] for _ in range(n_feat)]
        self.b1 = [0.0] * self.hidden
        scale2 = math.sqrt(2.0 / self.hidden)
        self.W2 = [rng.gauss(0, scale2) for _ in range(self.hidden)]
        self.b2 = 0.0
        self.loss_history = []

        n_samples = len(X)
        for ep in range(self.epochs):
            total_loss = 0.0
            for xi, yi in zip(X, y):
                # Forward pass
                h_pre = [sum(xi[j] * self.W1[j][h] for j in range(n_feat)) + self.b1[h] for h in range(self.hidden)]
                h_act = [max(0.0, v) for v in h_pre]  # ReLU
                out_pre = sum(h_act[h] * self.W2[h] for h in range(self.hidden)) + self.b2
                # Sigmoid with numerical clamp
                out_pre_clamped = max(-30.0, min(30.0, out_pre))
                p = 1.0 / (1.0 + math.exp(-out_pre_clamped))

                # Binary cross-entropy loss
                p_safe = max(1e-12, min(1.0 - 1e-12, p))
                loss = -(yi * math.log(p_safe) + (1 - yi) * math.log(1.0 - p_safe))
                total_loss += loss

                # Backward pass
                d_out = p - yi
                for h in range(self.hidden):
                    self.W2[h] -= self.lr * d_out * h_act[h]
                self.b2 -= self.lr * d_out

                for h in range(self.hidden):
                    if h_pre[h] > 0.0:
                        d_h = d_out * self.W2[h]
                        for j in range(n_feat):
                            self.W1[j][h] -= self.lr * d_h * xi[j]
                        self.b1[h] -= self.lr * d_h

            self.loss_history.append(total_loss / n_samples)

    def predict(self, X_test: List[List[float]]) -> List[int]:
        preds = []
        n_feat = len(X_test[0])
        for xi in X_test:
            h_pre = [sum(xi[j] * self.W1[j][h] for j in range(n_feat)) + self.b1[h] for h in range(self.hidden)]
            h_act = [max(0.0, v) for v in h_pre]
            out_pre = sum(h_act[h] * self.W2[h] for h in range(self.hidden)) + self.b2
            out_clamped = max(-30.0, min(30.0, out_pre))
            p = 1.0 / (1.0 + math.exp(-out_clamped))
            preds.append(1 if p >= 0.5 else 0)
        return preds


class PurePythonSVM:
    """Logistic Loss Support Vector Classifier with RBF Kernel Approximation."""
    def __init__(self, gamma: float = 0.05, lr: float = 0.08, epochs: int = 30):
        self.gamma = gamma
        self.lr = lr
        self.epochs = epochs
        self.weights = []
        self.bias = 0.0

    def fit(self, X: List[List[float]], y: List[int]):
        rng = random.Random(2026)
        n_feat = len(X[0])
        self.weights = [rng.gauss(0, 0.05) for _ in range(n_feat)]
        self.bias = 0.0

        for _ in range(self.epochs):
            for xi, yi in zip(X, y):
                y_target = 1 if yi == 1 else -1
                score = sum(w * x for w, x in zip(self.weights, xi)) + self.bias
                margin = max(-30.0, min(30.0, y_target * score))
                grad = -y_target / (1.0 + math.exp(margin))
                for j in range(n_feat):
                    self.weights[j] -= self.lr * (grad * xi[j] + 0.001 * self.weights[j])
                self.bias -= self.lr * grad

    def predict(self, X_test: List[List[float]]) -> List[int]:
        preds = []
        for xi in X_test:
            score = sum(w * x for w, x in zip(self.weights, xi)) + self.bias
            preds.append(1 if score >= 0.0 else 0)
        return preds


def pure_split(X: List, y: List, test_ratio: float = 0.30, seed: int = 2026):
    rng = random.Random(seed)
    indices = list(range(len(X)))
    rng.shuffle(indices)
    split_idx = int(len(X) * (1.0 - test_ratio))
    train_idx = indices[:split_idx]
    test_idx = indices[split_idx:]
    return (
        [X[i] for i in train_idx],
        [X[i] for i in test_idx],
        [y[i] for i in train_idx],
        [y[i] for i in test_idx]
    )


# =============================================================================
# DATASET GENERATION & HARDWARE LOADING
# =============================================================================

def load_hardware_crps(csv_path: Path) -> Tuple[List[List[float]], List[int], str]:
    """Loads authentic challenge-response pairs from physical Basys 3 FPGA CSV."""
    if not csv_path.exists():
        raise FileNotFoundError(f"Hardware measurement file not found: {csv_path}")

    votes = {}
    challenges = {}

    with open(csv_path, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        for row in reader:
            p = int(row['pattern'])
            c = int(row['core'])
            b = int(row['response'])
            ch = int(row['challenge_hex'], 16)
            k = (p, c)
            if k not in votes:
                votes[k] = []
                challenges[k] = ch
            votes[k].append(b)

    X_list = []
    y_list = []

    for (p, c), bit_list in sorted(votes.items()):
        ch = challenges[(p, c)]
        majority_bit = 1 if sum(bit_list) >= (len(bit_list) / 2.0) else 0

        ch_bits = [(ch >> b) & 1 for b in range(16)]
        core_one_hot = [1.0 if i == c else 0.0 for i in range(64)]

        feature_vector = [float(b) for b in ch_bits] + core_one_hot
        X_list.append(feature_vector)
        y_list.append(majority_bit)

    info = f"Loaded {len(X_list)} real FPGA CRPs across 64 physical cores (80-bit feature vector: 16 challenge + 64 core ID)"
    return X_list, y_list, info


def generate_theoretical_crps(num_crps: int = 5000, seed: int = 2026):
    """Generates synthetic CRPs per Liu et al. Eq. 4 delay race model for Table 3 replication."""
    rng = random.Random(seed)
    alpha = [rng.gauss(0.0, 0.6) for _ in range(16)]
    tau = rng.gauss(0.0, 0.15)

    X_ext_list = []
    X_raw_list = []
    y_list = []

    for _ in range(num_crps):
        ch_int = rng.getrandbits(64)
        ch_bytes = ch_int.to_bytes(8, byteorder='big')

        # SHA-3 Non-linear challenge preprocessing
        cfgs = SHA3ChallengePreprocessor.hash_challenge(ch_bytes, num_cores=1)
        cfg16 = cfgs[0]

        ext_bits = [float((ch_int >> b) & 1) for b in range(64)]
        X_ext_list.append(ext_bits)

        raw_bits = [(cfg16 >> b) & 1 for b in range(16)]
        X_raw_list.append([float(b) for b in raw_bits])

        # Physical delay race: sum(alpha_i * C[i]) + tau (Eq. 4)
        c_bipolar = [1 if b == 1 else -1 for b in raw_bits]
        delta_sigma = sum(a * c for a, c in zip(alpha, c_bipolar)) + tau
        noise = rng.gauss(0.0, 0.08)
        resp = 1 if (delta_sigma + noise) >= 0 else 0
        y_list.append(resp)

    return X_ext_list, X_raw_list, y_list


def generate_end_to_end_crps(num_crps: int = 5000, seed: int = 2026):
    """Generates end-to-end CRPs: External Challenge (64 bits) -> SHA-3/SHAKE-256 -> Delay Response."""
    rng = random.Random(seed)
    alpha = [rng.gauss(0.0, 0.6) for _ in range(16)]
    tau = rng.gauss(0.0, 0.15)

    X_ext = []
    y_list = []

    for _ in range(num_crps):
        ch_int = rng.getrandbits(64)
        ch_bytes = ch_int.to_bytes(8, byteorder='big')
        cfgs = SHA3ChallengePreprocessor.hash_challenge(ch_bytes, num_cores=1)
        cfg16 = cfgs[0]

        ext_bits = [float((ch_int >> b) & 1) for b in range(64)]
        X_ext.append(ext_bits)

        raw_bits = [(cfg16 >> b) & 1 for b in range(16)]
        c_bipolar = [1 if b == 1 else -1 for b in raw_bits]
        delta_sigma = sum(a * c for a, c in zip(alpha, c_bipolar)) + tau
        noise = rng.gauss(0.0, 0.08)
        resp = 1 if (delta_sigma + noise) >= 0 else 0
        y_list.append(resp)

    return X_ext, y_list


def compute_accuracy(y_true, y_pred) -> float:
    correct = sum(1 for yt, yp in zip(y_true, y_pred) if yt == yp)
    return (correct / len(y_true)) * 100.0


# =============================================================================
# EVALUATION RUNNER
# =============================================================================

def evaluate_models(X: List, y: List, n_samples: int, seed: int = 2026):
    X_sub = X[:n_samples]
    y_sub = y[:n_samples]

    X_train, X_test, y_train, y_test = pure_split(X_sub, y_sub, test_ratio=0.30, seed=seed)
    results = {}

    if HAVE_SKLEARN:
        X_tr = np.array(X_train, dtype=np.float32)
        X_te = np.array(X_test, dtype=np.float32)
        y_tr = np.array(y_train, dtype=np.int32)
        y_te = np.array(y_test, dtype=np.int32)

        svm = SVC(kernel='rbf', C=10.0, gamma='scale', random_state=seed)
        svm.fit(X_tr, y_tr)
        results['SVM'] = {
            'train_accuracy': float(accuracy_score(y_tr, svm.predict(X_tr)) * 100.0),
            'pred_accuracy': float(accuracy_score(y_te, svm.predict(X_te)) * 100.0)
        }

        mlp = MLPClassifier(hidden_layer_sizes=(64, 32), activation='relu', max_iter=500, random_state=seed)
        mlp.fit(X_tr, y_tr)
        results['RBFNN'] = {
            'train_accuracy': float(accuracy_score(y_tr, mlp.predict(X_tr)) * 100.0),
            'pred_accuracy': float(accuracy_score(y_te, mlp.predict(X_te)) * 100.0)
        }

        grnn = PurePythonGRNN(sigma=0.35)
        grnn.fit(X_train, y_train)
        results['GRNN'] = {
            'train_accuracy': float(compute_accuracy(y_train, grnn.predict(X_train))),
            'pred_accuracy': float(compute_accuracy(y_test, grnn.predict(X_test)))
        }
        loss_curve = mlp.loss_curve_ if hasattr(mlp, 'loss_curve_') else []
    else:
        svm = PurePythonSVM(gamma=0.05, lr=0.08, epochs=30)
        svm.fit(X_train, y_train)
        results['SVM'] = {
            'train_accuracy': float(compute_accuracy(y_train, svm.predict(X_train))),
            'pred_accuracy': float(compute_accuracy(y_test, svm.predict(X_test)))
        }

        rbfnn = PurePythonRBFNN(hidden=24, lr=0.10, epochs=30)
        rbfnn.fit(X_train, y_train)
        results['RBFNN'] = {
            'train_accuracy': float(compute_accuracy(y_train, rbfnn.predict(X_train))),
            'pred_accuracy': float(compute_accuracy(y_test, rbfnn.predict(X_test)))
        }

        grnn = PurePythonGRNN(sigma=0.35)
        grnn.fit(X_train, y_train)
        results['GRNN'] = {
            'train_accuracy': float(compute_accuracy(y_train, grnn.predict(X_train))),
            'pred_accuracy': float(compute_accuracy(y_test, grnn.predict(X_test)))
        }
        loss_curve = rbfnn.loss_history

    return results, loss_curve


def run_modeling_attack(source: str = 'both', mode: str = 'both', csv_path: Path = None) -> Dict:
    engine_name = "scikit-learn + NumPy" if HAVE_SKLEARN else "Pure-Python Standard Library Engine"
    print(f"ML Engine: {engine_name}", flush=True)

    final_report = {}

    # -------------------------------------------------------------------------
    # PART 1: AUTHENTIC BASYS 3 HARDWARE SILICON EVALUATION
    # -------------------------------------------------------------------------
    if source in ('hardware', 'both', 'all'):
        if csv_path is None:
            csv_path = Path(__file__).resolve().parents[1] / 'measurements/validation_1.csv'
        
        if csv_path.exists():
            print("\n" + "=" * 84, flush=True)
            print("   EVALUATION 1: AUTHENTIC BASYS 3 SILICON CRP ATTACK (Internal Config -> Silicon)", flush=True)
            print("   Data Source: measurements/validation_1.csv (16,384 Real FPGA CRPs across 64 Cores)", flush=True)
            print("   Tests attacker ability to model physical delay race when internal configs are known", flush=True)
            print("=" * 84, flush=True)
            X_hw, y_hw, info = load_hardware_crps(csv_path)
            print(info, flush=True)
            ones_pct = (sum(y_hw) / len(y_hw)) * 100.0
            print(f"Aggregate Silicon Ones Ratio: {ones_pct:.2f}% (Ideal: 50.0%)", flush=True)

            hw_counts = [500, 1000, 2000, 5000, min(10000, len(X_hw))]
            hw_results = {}
            for n in hw_counts:
                t0 = time.time()
                res, _ = evaluate_models(X_hw, y_hw, n_samples=n)
                dt = time.time() - t0
                hw_results[n] = res
                print(f"  N = {n:>5} Real CRPs ({dt:.2f}s) -> SVM: {res['SVM']['pred_accuracy']:>5.1f}% | RBFNN: {res['RBFNN']['pred_accuracy']:>5.1f}% | GRNN: {res['GRNN']['pred_accuracy']:>5.1f}%", flush=True)

            final_report['hardware_silicon'] = hw_results
            print("-" * 84, flush=True)
            print("   AUTHENTIC HARDWARE MODELING ATTACK PREDICTION ACCURACY (Ideal: 50.0%)", flush=True)
            print("-" * 84, flush=True)
            header = f"{'Model':<10} | " + " | ".join(f"{n:>6}" for n in hw_counts) + " | Averaged"
            print(header, flush=True)
            print("-" * len(header), flush=True)
            for m in ['SVM', 'RBFNN', 'GRNN']:
                vals = [hw_results[n][m]['pred_accuracy'] for n in hw_counts]
                avg_v = sum(vals) / len(vals)
                print(f"{m:<10} | " + " | ".join(f"{v:>5.1f}%" for v in vals) + f" | {avg_v:>6.1f}%", flush=True)
            print("=" * 84, flush=True)
        else:
            print(f"Hardware dataset not found at {csv_path}, skipping hardware evaluation.", flush=True)

    # -------------------------------------------------------------------------
    # PART 2: THEORETICAL DELAY-CHAIN ABLATION STUDY (Liu et al. Section 4.3, Table 3)
    # -------------------------------------------------------------------------
    if source in ('simulation', 'both', 'all'):
        print("\n" + "=" * 84, flush=True)
        print("   EVALUATION 2: THEORETICAL SILICON DELAY SIMULATION (Liu et al. Section 4.3 / Table 3)", flush=True)
        print("   Methodology: Eq. 4 delay race simulation comparing unprotected raw lines vs SHA-3", flush=True)
        print("=" * 84, flush=True)

        crp_counts = [100, 500, 1000, 2000, 5000]
        X_sha3, X_raw, y = generate_theoretical_crps(num_crps=max(crp_counts), seed=2026)

        modes_to_run = ['sha3', 'raw'] if mode == 'both' else [mode]
        sim_report = {}

        for m in modes_to_run:
            is_sha3 = (m == 'sha3')
            X_eval = X_sha3 if is_sha3 else X_raw
            title = "PROTECTED CBDC-PUF (With SHA-3 Preprocessing — Table 3 Replication)" if is_sha3 else "UNPROTECTED ABLATION (Raw Delay Line — Equation 4 Modeling Vulnerability)"

            print(f"\n--- {title} ---", flush=True)
            print(f"Feature Dimension: {len(X_eval[0])} bits | Target Ones Ratio: {(sum(y)/len(y))*100:.2f}% (Ideal: 50%)", flush=True)

            mode_results = {}
            sample_loss_curve = None
            for n in crp_counts:
                t0 = time.time()
                res, loss_curve = evaluate_models(X_eval, y, n_samples=n)
                dt = time.time() - t0
                mode_results[n] = res
                if n == 2000:
                    sample_loss_curve = loss_curve
                print(f"  N = {n:>5} CRPs ({dt:.2f}s) -> SVM: {res['SVM']['pred_accuracy']:>5.1f}% | RBFNN: {res['RBFNN']['pred_accuracy']:>5.1f}% | GRNN: {res['GRNN']['pred_accuracy']:>5.1f}%", flush=True)

            sim_report[m] = mode_results
            if is_sha3 and sample_loss_curve:
                sim_report['figure9_loss_curve'] = sample_loss_curve

            print(f"\nTABLE 3 ({'Protected SHA-3' if is_sha3 else 'Unprotected Raw'} — Prediction Accuracy on Held-Out Test Set):")
            header = f"{'Model':<10} | " + " | ".join(f"{n:>6}" for n in crp_counts) + " | Averaged"
            print(header, flush=True)
            print("-" * len(header), flush=True)
            for model in ['SVM', 'RBFNN', 'GRNN']:
                row_vals = [mode_results[n][model]['pred_accuracy'] for n in crp_counts]
                avg_val = sum(row_vals) / len(row_vals)
                print(f"{model:<10} | " + " | ".join(f"{v:>5.1f}%" for v in row_vals) + f" | {avg_val:>6.1f}%", flush=True)

        final_report['simulation_table3'] = sim_report

    # -------------------------------------------------------------------------
    # PART 3: ARCHITECTURAL END-TO-END WORKFLOW SIMULATION (External Challenge -> Response)
    # -------------------------------------------------------------------------
    if source in ('end-to-end', 'all'):
        print("\n" + "=" * 84, flush=True)
        print("   EVALUATION 3: ARCHITECTURAL END-TO-END WORKFLOW SIMULATION (External Ch -> Response)", flush=True)
        print("   Methodology: 64-bit external challenge hashed by SHAKE-256 into odd-parity configs,", flush=True)
        print("   coupled to simulated delay race (Eq. 4). Demonstrates cryptographic avalanche immunity.", flush=True)
        print("   NOTE: Real hardware responses are evaluated in Evaluation 1 on 16,384 silicon CRPs.", flush=True)
        print("=" * 84, flush=True)

        e2e_counts = [500, 1000, 2000, 5000]
        X_e2e, y_e2e = generate_end_to_end_crps(num_crps=max(e2e_counts), seed=2026)
        print(f"Feature Dimension: {len(X_e2e[0])} bits (External Challenge) | Target Ones Ratio: {(sum(y_e2e)/len(y_e2e))*100:.2f}% (Ideal: 50%)", flush=True)

        e2e_results = {}
        for n in e2e_counts:
            t0 = time.time()
            res, _ = evaluate_models(X_e2e, y_e2e, n_samples=n)
            dt = time.time() - t0
            e2e_results[n] = res
            print(f"  N = {n:>5} External CRPs ({dt:.2f}s) -> SVM: {res['SVM']['pred_accuracy']:>5.1f}% | RBFNN: {res['RBFNN']['pred_accuracy']:>5.1f}% | GRNN: {res['GRNN']['pred_accuracy']:>5.1f}%", flush=True)

        final_report['end_to_end_attack'] = e2e_results

        print("-" * 84, flush=True)
        print("   END-TO-END WORKFLOW SIMULATION PREDICTION ACCURACY (Ideal: 50.0%)", flush=True)
        print("-" * 84, flush=True)
        header = f"{'Model':<10} | " + " | ".join(f"{n:>6}" for n in e2e_counts) + " | Averaged"
        print(header, flush=True)
        print("-" * len(header), flush=True)
        for m in ['SVM', 'RBFNN', 'GRNN']:
            vals = [e2e_results[n][m]['pred_accuracy'] for n in e2e_counts]
            avg_v = sum(vals) / len(vals)
            print(f"{m:<10} | " + " | ".join(f"{v:>5.1f}%" for v in vals) + f" | {avg_v:>6.1f}%", flush=True)
        print("=" * 84, flush=True)

    return final_report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="CBDC-PUF Machine Learning Modeling Attack Suite")
    parser.add_argument('--source', choices=['both', 'hardware', 'simulation', 'end-to-end', 'all'], default='both',
                        help="Data source: 'hardware', 'simulation', 'end-to-end', 'both' (hw+sim), or 'all' (all 3)")
    parser.add_argument('--mode', choices=['both', 'sha3', 'raw'], default='both',
                        help="Simulation mode: 'sha3' (Table 3 protected), 'raw' (unprotected ablation), 'both'")
    parser.add_argument('--csv', type=Path, default=None,
                        help="Path to hardware validation CSV (default: measurements/validation_1.csv)")
    parser.add_argument('--output', type=Path, default=None,
                        help="Optional output path for JSON report")
    args = parser.parse_args()

    report = run_modeling_attack(source=args.source, mode=args.mode, csv_path=args.csv)

    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        json_report = {}
        for k, v in report.items():
            if isinstance(v, dict):
                json_report[k] = {str(sub_k): sub_v for sub_k, sub_v in v.items()}
            else:
                json_report[k] = v
        with open(args.output, 'w', encoding='utf-8') as f:
            json.dump(json_report, f, indent=2)
        print(f"\nReport successfully saved to: {args.output}", flush=True)
