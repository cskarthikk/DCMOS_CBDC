# Candidate smoke result

Source: `measurements/run_4ed1e5348c3e40abbd34ed6da7409747.csv` and its metadata. Recorded bitstream SHA256 matches `build_internal_matched_v2/candidate.bit`: EA95455975095342B43FBEDF5592B7CC4592D20A0E328B1E9C795A5C516AB8E6. This is file provenance plus the operator's programming confirmation, not independent firmware identification.

24 accepted responses; eight distinct odd-parity challenges; trial IDs 1..3 exactly once; expected 21 status flags; binary responses. Fifteen ones (62.5%). All eight challenges constant within these three attempts; no mixed challenges or ties. 0001/0002/0007/0008/001F returned 111; 8000/7FFF/8003 returned 000.

The CSV contains no measured activity flags. UART/control exchange succeeded and both response values were observed. This does not prove correct asynchronous arbitration or establish whole-space balance, entropy, uniqueness or long-term repeatability. Eight prescribed challenges are a smoke set and must not be compared directly with the old mixed-parity 256-challenge ones percentage.

The analyzer compares shared challenges only: three of eight majority bits differ from the original design. Different architectures/routes are expected to change responses; these are not temporal error counts. No single change can be credited with the differences.

`scripts/analyze_candidate.ps1` validates metadata, protocol flags, odd parity, row counts and trial IDs; it preserves unavailable activity values and handles majority ties explicitly. Analysis is saved to unique folders beside the input CSV. The real smoke data and synthetic tie/invalid-trial/invalid-protocol cases were checked without serial access.

Next bounded evaluation: one 256-challenge x20 collection with the same candidate bitstream and deterministic odd-parity challenge list. Analyze within-run behavior, individual challenges and shared challenges with the original. Hardware acceptance and physical symmetry review remain pending; this smoke result does not designate the final baseline.
