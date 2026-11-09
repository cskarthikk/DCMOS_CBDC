# Corrections and verification

The ML syntax error is fixed. Hardware/simulation ML tables now come from committed JSON rather than unsupported scores. The complete hardware ML command was rerun and reproduced the saved results exactly: mean SVM 59.82%, RBFNN-labelled 50.54%, GRNN 52.85%.

Demo/CLI output distinguishes output length from unknown conditional entropy. Misleading entropy guarantees were removed from engine documentation and test output; codec/extractor operations are unchanged. The CLI now reports output_bits and entropy_assessment instead of falsely asserting entropy_bits. The historical secure mode/class names remain for compatibility.

Resource counts, power-component values, rebuild-payload versus whole-file hashes, simulation versus physical timing, simulation versus hardware attack results, and sample/voting scope were corrected in README and the main report. Fixed success/security messages were removed from analyzers. Complete capture checks reject duplicate, incomplete, inconsistent-status and mismatched-configuration observations. Voting still resolves ties to one and code-offset reconstruction uses cores 0..61; these choices are now disclosed.

Verification passed: Python/PowerShell syntax, codec self-tests, PowerShell CLI enrollment/reconstruction, malformed capture rejection, replayed correction comparison, regenerated NIST scores, full hardware ML evaluation, root verification and collector VerifyOnly. See CHECKS.json and logs in this folder. The selected bitstream hash is unchanged; no RTL or board programming changes were made.

Observed correction results remain 256/256 after twenty-reading voting, 252/256 single-trial code-offset, and 255/256 single-trial legacy reconstruction. These observations do not certify secrecy or universal reliability. The custom NIST suite still requires independent implementation/sample-prerequisite validation before compliance claims. Joint/conditional entropy, protected-board attack resistance, inter-device uniqueness and environmental reliability remain stated limitations.
