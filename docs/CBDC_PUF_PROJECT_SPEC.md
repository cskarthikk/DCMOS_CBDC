# CBDC-PUF Project Implementation Specification

## Project brief for Antigravity / AI coding agents

**Project title:** Design and Implementation of a Configurable Butterfly
Delay Chain-Based Physical Unclonable Function (CBDC-PUF)

**Course:** Digital CMOS\
**Project weight:** 20% of course grade\
**Reference paper:** Yanjiang Liu, Junwei Li, Tongzhou Qu, Zibin Dai,
"CBDC-PUF: A Novel Physical Unclonable Function Design Framework
Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"
ACM Transactions on Design Automation of Electronic Systems, Vol. 28,
No. 5, Article 78, September 2023. DOI: 10.1145/3588435.

**Primary goal:** Reproduce as much of the paper's design as is
technically feasible on the hardware and tools provided by the college,
prioritizing a faithful physical CBDC-PUF core, then response
processing, hardware data collection, and defensible evaluation. Do not
substitute arbitrary simulated randomness for physical variation or
claim unperformed experiments.

**Current constraints:** The team has five members. Hardware is not
currently available at home; the exact college FPGA board and tool
versions have not yet been confirmed. The project deadline is during
November 2026. Plan for a tight schedule and identify platform risks
early.

------------------------------------------------------------------------

# 1. Instructions to the AI coding agent

You are assisting with a university Digital CMOS implementation project
based on the reference paper above. Your role is to help create
implementation artifacts, code, tests, documentation, and experiment
tooling in small verifiable stages.

## Non-negotiable rules

1.  **Treat the paper as the primary source for its architecture.** Do
    not silently replace the CBDC-PUF with a generic ring oscillator
    PUF, arbiter PUF, random-number generator, or arbitrary bit
    generator.
2.  **Do not claim RTL simulation reproduces manufacturing variation.**
    A normal digital simulation can validate control logic and
    functional interfaces, but not physical chip-to-chip uniqueness or
    true physical timing variation.
3.  **Do not fabricate experimental results.** Paper results are
    reference values only. Mark all project results as "not measured"
    until actual data is collected.
4.  **Do not claim full replication if the board/platform cannot support
    the implementation details.** Record every deviation from the paper
    and explain why it was necessary.
5.  **Keep functional models separate from physical implementation.**
    Name and document them clearly. A behavioral model may be used to
    test control/data flow, but it must not be presented as a physical
    PUF.
6.  **Do not invent undocumented details.** If an exact connection,
    timing condition, SHA-3 variant, hash interface, BCH bit ordering,
    or data flow is unclear, consult the paper's figures/text and record
    the uncertainty. Ask the user to provide the relevant page/figure if
    needed.
7.  **Use incremental milestones.** Before implementing the full system,
    make sure the target board, FPGA family, toolchain, and supported
    primitives are known.
8.  **Write tests with each module.** For algorithms such as SHA-3 and
    BCH, use independent known test vectors and edge cases.
9.  **Do not optimize away essential delay paths.** Physical
    implementation must be inspected after synthesis and
    place-and-route. Ordinary RTL semantics may not preserve the delay
    structures needed by a PUF.
10. **No misleading security claims.** SHA-3 does not itself create
    physical uniqueness, and low prediction accuracy on one experiment
    does not prove general resistance to modelling attacks.

## How to work

-   First inspect the project directory and list what exists.
-   Create a short implementation plan and ask for missing environment
    facts before committing to FPGA-specific code.
-   Prefer small modules with explicit interfaces and tests.
-   Keep a `README.md`, a `docs/` directory, and a `results/` directory.
-   Include commands to build/run tests once the toolchain is known.
-   Make every result reproducible where possible.
-   If multiple implementation choices exist, explain the trade-off and
    recommend one; do not silently choose an architecture that differs
    from the paper.

------------------------------------------------------------------------

# 2. Problem statement and purpose

A Physical Unclonable Function (PUF) uses physical variations in a
manufactured circuit to produce a device-dependent response. In a
delay-based PUF, small differences in signal-path delay can influence a
captured digital result.

The CBDC-PUF paper proposes a configurable butterfly delay-chain design
intended to generate challenge-response pairs (CRPs) and mitigate
modelling attacks. The design compares timing behavior in two configured
paths. A capture element, described as a D flip-flop, records a result
influenced by their relative timing.

## Practical application example

A device-authentication system could use a PUF response as evidence that
a device contains expected hardware. A verifier supplies a challenge and
checks the returned response against a securely registered reference or
a suitable protocol. A PUF is a component, not a complete authentication
protocol; challenge exposure, replay, modelling, noise, and enrollment
must be handled by the wider system.

## What this course project is and is not

**It is:** an implementation and evaluation of the paper's
circuit/framework, adapted only where the actual platform forces a
documented change.

**It is not:** merely a literature review, a slide deck, a generic
random-bit generator, or a behavioral simulation presented as proof of
physical uniqueness.

------------------------------------------------------------------------

# 3. Paper-derived design facts to preserve

The following are details reported in the selected paper and should
guide the implementation. Confirm exact wiring and dataflow against the
original paper figures before coding.

-   The core is a configurable butterfly delay-chain structure with two
    configurable delay paths, cross-coupled connections, and a D
    flip-flop used to capture a stable state/result.
-   Each configurable delay element is described as containing a buffer
    and an inverter, with control bits selecting signal
    propagation/inversion behavior.
-   The control sequence has three stages: initialization, excitation,
    and data latching.
-   The challenge is a control vector; the response is the captured
    output. Together these form challenge-response pairs (CRPs).
-   The paper discusses SHA-3 hashing to introduce nonlinearity/obscure
    a simple relationship between challenge and response, and BCH error
    correction to handle unstable bits.
-   The paper's reported FPGA platform is Xilinx XC7A200T-2FGG484.
-   The paper mentions FPGA primitives including LUT2, NAND2, and FDCE_1
    and manually adjusts/fixes placement and modifies routing of
    differential paths to make them approximately equal. The design is
    treated as a hard macro/physical structure.
-   The paper uses a 16-bit control vector, corresponding to 65,536
    possible configurations.
-   The paper describes 128 PUF instances/blocks to create a 128-bit
    response.
-   The paper describes SHA-3 producing 2048-bit hash data.
-   The paper specifies BCH(31,16,3), described as correcting up to
    three errors in a 16-bit response/code construction. Verify the
    exact encode/decode and integration dataflow from the paper; do not
    infer that a 2048-bit hash is one BCH codeword.
-   The reported test platform includes a Nuclei MCU200T and Xilinx
    XC7A200T FPGA, PC serial connection, and LabVIEW for collecting
    responses.
-   Reported implementation figures include 10.627 ns latency, 92.799
    MHz maximum frequency, and power estimates of 0.427 W dynamic, 0.089
    W quiescent, 0.516 W total. These are the paper's figures, not
    expected results for this project.
-   The paper reports randomness around 49.6%; the abstract reports
    reliability 99.9%, while the results section gives mean stability
    around 99.4%; uniqueness is reported around 49.9% in the abstract
    and about 63.8 differing bits out of 128 in the results;
    modelling-attack prediction accuracy is reported around 50% for the
    tested models.
-   The paper notes a limitation regarding inter-die variation; do not
    imply its reported FPGA results prove broad cross-chip uniqueness.

**Important:** If the PDF or paper figure contradicts this summary,
follow the primary paper and document the correction. Preserve the
distinction between the paper's claims and this team's results.

------------------------------------------------------------------------

# 4. Scope and priorities

## P0 --- Must-have core

1.  Confirm hardware/toolchain.
2.  Reconstruct the core circuit and control sequence.
3.  Implement the configurable butterfly delay-chain structure as
    faithfully as the platform allows.
4.  Apply appropriate physical constraints and inspect the implemented
    netlist/layout.
5.  Capture output responses and create a reproducible data-collection
    path.
6.  Document platform limitations and any deviations.

## P1 --- Full framework target

1.  Implement SHA-3 as specified by the paper.
2.  Implement BCH(31,16,3) as specified by the paper.
3.  Integrate the processing path according to the paper's actual
    architecture.
4.  Reproduce the intended 128-instance/128-bit response architecture if
    resource and platform constraints permit.
5.  Test processing modules independently and as integrated blocks.

## P2 --- Evaluation target

1.  Response balance/randomness.
2.  Repeatability/reliability under repeated measurements.
3.  Uniqueness across independent physical devices, if available.
4.  Latency, frequency/timing, and resource usage.
5.  Power estimation or measurement, clearly identifying the method.
6.  Machine-learning modelling attack using suitable CRP data, if
    feasible.
7.  Compare the measured results with the paper's results without
    implying they should match exactly.

## P3 --- Stretch goals

-   Reproduce the PC/serial data collection setup or an equivalent
    documented collection workflow.
-   Automate challenge selection, response logging, and analysis.
-   Reproduce SVM, GRNN, and RBFNN modelling attacks if enough data and
    time are available.
-   Explore repeatability under different operating conditions if
    equipment and time allow.

Do not let P2/P3 work delay the P0 core.

------------------------------------------------------------------------

# 5. Architecture and dataflow

Use the paper's figure(s) to create the authoritative block diagram. At
a high level, the system is expected to contain:

1.  **Challenge/configuration interface:** accepts the control vector
    and operation commands.
2.  **Control sequencer:** performs initialization, excitation, and
    latching in the correct order.
3.  **CBDC-PUF physical core:** two configurable delay paths,
    cross-coupled/feedback connections, and capture logic.
4.  **Response assembly:** collects response bits from the configured
    PUF instances.
5.  **SHA-3 processing:** implements the paper's specified hash behavior
    and interface.
6.  **BCH error-correction path:** implements the paper's stated BCH
    configuration and data flow.
7.  **Host/data interface:** sends challenges and responses to a
    PC/microcontroller or equivalent.
8.  **Measurement and analysis tooling:** records data and computes
    metrics.

Do not assume the block order of SHA-3 and BCH. Verify the paper's
diagram and text and encode that exact dataflow in the design notes.

------------------------------------------------------------------------

# 6. Hardware/platform decision gate

Before creating final FPGA-specific code, collect:

-   FPGA board name and exact device part number.
-   FPGA family and board revision.
-   Installed tool and version (e.g., Vivado version).
-   Whether the design can use device primitives and location/routing
    constraints.
-   Whether the college permits custom placement and routing.
-   Whether a second independent FPGA is available for cross-device
    uniqueness tests.
-   Available host interface (USB-UART, serial, JTAG, microcontroller,
    etc.).
-   Whether power measurement equipment is available.
-   Course instructor's expectations for implementation fidelity.

## If the exact paper platform is available

Attempt a close reproduction of its primitives, placement, routing, and
control flow.

## If a different compatible FPGA is available

Port carefully, document all primitive and routing differences, and do
not assume physical results will match the paper.

## If no suitable FPGA or placement/routing control is available

Ask the instructor to approve a fallback. A functional HDL model can
demonstrate logic and dataflow but does not validate the physical PUF
effect. Clearly label any such implementation as a limited functional
model rather than a full physical replication.

------------------------------------------------------------------------

# 7. Suggested repository structure

Create a clean repository. Adapt the exact HDL language and tool files
after confirming the environment.

``` text
cbdc-puf/
├── README.md
├── PROJECT_SPEC.md
├── docs/
│   ├── paper_notes.md
│   ├── architecture.md
│   ├── control_sequence.md
│   ├── platform_and_deviations.md
│   ├── experiment_protocol.md
│   └── report_outline.md
├── rtl/
│   ├── cbdc_puf_core.*
│   ├── cbdc_control.*
│   ├── response_assembly.*
│   ├── sha3_wrapper.*
│   ├── bch_encoder.*
│   ├── bch_decoder.*
│   └── cbdc_puf_top.*
├── constraints/
│   └── device_and_physical_constraints.*
├── sim/
│   ├── core_functional_tb.*
│   ├── control_tb.*
│   ├── sha3_tb.*
│   └── bch_tb.*
├── scripts/
│   ├── build.*
│   ├── collect_responses.*
│   └── analyse_results.*
├── data/
│   ├── README.md
│   └── raw/
├── results/
│   ├── README.md
│   ├── plots/
│   └── tables/
├── reports/
│   └── final_report.md
└── presentation/
    └── slide_outline.md
```

Use real file extensions and syntax for the chosen toolchain. Do not
create empty modules that appear complete; mark placeholders clearly.

------------------------------------------------------------------------

# 8. Module requirements

## 8.1 CBDC-PUF core

**Purpose:** Generate the response from the configured physical timing
structure.

Requirements: - Reflect the paper's configurable butterfly delay-chain
topology. - Include the documented configuration/control vector. -
Implement the required buffer/inverter selection behavior using the
target FPGA's appropriate primitives/structure where possible. -
Preserve cross-coupled connections and intended differential path
structure. - Include capture/latching logic consistent with the paper. -
Make the initialization, excitation, and latching sequence explicit. -
Keep physical constraints separate from generic RTL. - Add comments that
explain why synthesis/placement/routing behavior matters.

Verification: - Review the post-synthesis netlist and implementation
reports. - Confirm the relevant paths and primitives remain present. -
Inspect placement and routing to the extent the tool permits. - Record
timing reports. - Do not treat an arbitrary deterministic RTL output as
a physical PUF response.

## 8.2 Control sequencer

Requirements: - Provide an explicit state/sequence for initialization,
excitation, and data latching. - Define legal command transitions and
response-valid behavior. - Avoid latching before the intended
measurement phase. - Provide a repeatable means of starting a new
measurement.

Verification: - Test legal sequences, reset behavior, and repeated
commands. - Document the capture timing and its relationship to the
paper. - Keep functional sequencing tests distinct from physical timing
validation.

## 8.3 Response assembly / multiple instances

Requirements: - Follow the paper's intended 128-instance/128-bit
response organization if feasible. - Define how each instance is
selected/configured and how responses are assembled. - Make data
ordering and bit indexing explicit. - Document resource constraints if
the full architecture cannot fit.

Verification: - Confirm output width and bit order. - Test assembly
using controlled test inputs. - Do not claim multi-device uniqueness
from multiple instances placed on the same FPGA; these are not
independent manufactured dies.

## 8.4 SHA-3

Requirements: - Verify which exact SHA-3 variant/interface the paper
uses. The paper reports 2048-bit hash data; do not assume that means the
standard SHA3-256 digest or silently substitute a different variant. -
Document input length, output length, padding, byte/bit order, and
throughput/latency. - Keep the hash block's interface separate from the
physical PUF core.

Verification: - Use known-answer test vectors for the chosen
standard/variant. - Test empty input and representative nonempty inputs
where relevant. - Test the interface and bit ordering. - Verify the
paper's stated dataflow before integration.

## 8.5 BCH encoder/decoder

Requirements: - Implement BCH(31,16,3) as specified in the paper. -
Confirm generator polynomial, field convention, codeword bit ordering,
shortening/padding if any, and encoder/decoder arrangement from the
paper or its cited references. - Do not assume these details if the
paper does not specify them; document the chosen interpretation and ask
for clarification if needed. - Handle valid codewords and error patterns
within the correction capability.

Verification: - Known codeword tests. - Zero-error decode. - One-, two-,
and three-bit error tests in different positions. - Test behavior for
errors beyond correction capacity without promising correct recovery. -
Verify encode/decode data widths and integrated data flow.

## 8.6 Host/data collection interface

Requirements: - Make it possible to submit a challenge/configuration and
collect the resulting response. - Log device/board identifier,
challenge, response, timestamp or measurement index, and relevant
conditions. - Use a stable file format such as CSV. - Detect incomplete
transfers and malformed records. - Keep raw data immutable; generate
analysis output separately.

Possible implementation depends on the available platform: serial
interface, USB-UART, JTAG, microcontroller, or a documented manual
collection path.

------------------------------------------------------------------------

# 9. Verification strategy

Tests should be layered. A successful test at one level must not be
described as proof at another level.

## Level A: Algorithmic/functional tests

-   Control sequence behaves as specified.
-   Response interface widths and valid flags are correct.
-   SHA-3 matches known-answer test vectors.
-   BCH corrects test error patterns within its designed capability.
-   Response assembly preserves bit order.

These tests can be run without physical PUF hardware.

## Level B: FPGA implementation tests

-   Synthesis succeeds.
-   The expected primitives are present.
-   The intended differential structure survives implementation.
-   Placement/routing constraints are applied as intended.
-   Timing reports are saved.
-   The design fits the device and can be programmed.

## Level C: Physical response tests

-   Apply a defined set of challenges.
-   Collect multiple repetitions per challenge.
-   Record the environment and device identity.
-   Calculate repeatability and response balance.
-   Compare independent devices if available.
-   State clearly what cannot be inferred from the available number of
    devices.

## Level D: Modelling-attack tests

-   Define training and test splits to avoid leakage.
-   Record which challenge-response pairs are used for training and
    testing.
-   Implement the paper's stated model families (SVM, GRNN, RBFNN) if
    feasible.
-   Report sample counts, configuration, preprocessing, metrics, and
    uncertainty.
-   Compare against a 50% reference only when the prediction task is
    balanced binary classification and the comparison is appropriate.
-   Do not infer general security from one model, one dataset, or one
    device.

------------------------------------------------------------------------

# 10. Evaluation metrics and definitions

Write the exact formula and data requirements in the report before
calculating the metric. Follow the paper's definitions when they are
available.

## Response balance/randomness

Measure the fraction of 1s in the response bits, or use the paper's
exact randomness definition. A value near 50% indicates a balanced
distribution, but does not alone prove independence or cryptographic
randomness.

## Reliability/stability

Repeat the same challenge under the stated conditions and compare
responses. Report the bit error rate or the paper's reliability measure.
More repetitions and environmental conditions provide stronger evidence.

## Uniqueness

Compare responses from independent physical PUF instances/devices under
the same challenge, following the paper's exact method. For a 128-bit
response, ideal inter-device Hamming distance is near 64 bits on
average. A single FPGA cannot establish inter-die uniqueness.

## Modelling-attack prediction accuracy

Train the selected model using a defined CRP training set and evaluate
it on held-out challenge-response examples. Document the model
configuration, sample count, class balance, split method, and prediction
metric.

## Latency/frequency

Use the relevant timing reports or measured interface latency. State
whether the number is a tool estimate, path delay, or end-to-end system
latency; these are not interchangeable.

## Resource use

Report LUTs, flip-flops, memory, and other relevant resources from the
implementation report.

## Power

Distinguish tool-estimated power from measured power. State activity
assumptions, clock frequency, device, voltage, and tool version where
available. Do not compare power numbers without explaining differences
in methodology.

------------------------------------------------------------------------

# 11. Paper-reported reference results

These values are for comparison only and must never be copied into the
"our results" column without actual measurements.

  -----------------------------------------------------------------------
  Metric                              Reported in the paper
  ----------------------------------- -----------------------------------
  Randomness                          About 49.6%

  Reliability                         Abstract: 99.9%; results section:
                                      mean stability about 99.4%

  Uniqueness                          Abstract: about 49.9%; results
                                      section: about 63.8 differing bits
                                      out of 128

  Modelling prediction                About 50% for the tested models

  Latency                             10.627 ns

  Maximum frequency                   92.799 MHz

  Dynamic power                       0.427 W

  Quiescent power                     0.089 W

  Total power                         0.516 W
  -----------------------------------------------------------------------

The abstract/results discrepancy in reliability should be noted rather
than silently reconciled. Confirm the exact metric definitions and
context from the paper before making direct comparisons. The reported
uniqueness values may use different representations (percentage versus
average differing bits); follow the paper's formula when reproducing
them.

------------------------------------------------------------------------

# 12. Experiment data format

Use one row per measured response. Suggested CSV fields:

``` text
experiment_id,board_id,device_part,challenge_hex,repetition,response_raw,response_processed,temperature_c,voltage_v,tool_version,notes
```

Only populate fields you actually measure or know. Leave unknown fields
empty and explain why. Avoid overwriting raw measurements. Store derived
datasets and plots separately.

For every experiment, write a short protocol: - objective; -
hardware/software configuration; - challenge set; - repetitions per
challenge; - operating conditions; - data collection method; - analysis
formula; - known limitations.

------------------------------------------------------------------------

# 13. Schedule for a November deadline

The actual due date is not specified, so this schedule is relative and
must be adjusted immediately when the instructor confirms the deadline.

## First 1--2 days: environment and architecture

-   Confirm board and toolchain.
-   Reconstruct the circuit and control sequence.
-   Identify uncertain paper details.
-   Create repository and module interfaces.

## Next 2--4 days: core implementation

-   Implement the core and control.
-   Apply constraints where supported.
-   Inspect synthesis/implementation results.
-   Establish response capture.

## In parallel: SHA-3, BCH, and analysis tooling

-   Build processing blocks independently.
-   Verify known-answer/error-correction tests.
-   Prepare data logging and metric scripts.

## Following days: integration and hardware measurements

-   Integrate full framework as feasible.
-   Collect real data.
-   Fix issues in the core before adding optional modelling work.
-   Save all reports and raw measurements.

## Final days: evaluation and presentation

-   Reproduce plots from collected data.
-   Compare against paper results.
-   Document deviations and limitations.
-   Freeze the code and create a repeatable demo.
-   Prepare backup screenshots/video in case the live demo fails.

**Schedule rule:** if the physical core is not working, prioritise
diagnosing it over starting advanced ML experiments.

------------------------------------------------------------------------

# 14. Team task split

For five members:

1.  **Architecture and paper fidelity:** figures, dataflow, control
    sequence, paper-to-implementation traceability.
2.  **CBDC-PUF physical core:** HDL, FPGA primitives, constraints,
    placement/routing inspection.
3.  **SHA-3 and BCH:** implementations, test vectors, integration.
4.  **Hardware collection:** board setup, programming, interface, raw
    dataset and measurement log.
5.  **Evaluation and final report:** metric scripts, modelling
    experiments if feasible, plots, comparison, report/slides.

Have one designated integration owner, ideally Member 1 or 2,
responsible for accepting module interfaces and maintaining a
known-working build.

------------------------------------------------------------------------

# 15. Final submission checklist

## Design and implementation

-   [ ] Architecture traced to the paper.
-   [ ] CBDC-PUF core implemented and source documented.
-   [ ] Control sequence implemented.
-   [ ] Physical constraints included where supported.
-   [ ] Synthesis and implementation reports saved.
-   [ ] Deviations from the paper documented.
-   [ ] SHA-3 and BCH verified and integrated where feasible.
-   [ ] Multi-instance response assembly implemented or limitation
    explained.
-   [ ] Build instructions included.

## Testing and evaluation

-   [ ] Functional test evidence saved.
-   [ ] SHA-3 known-answer tests pass.
-   [ ] BCH correction tests pass for supported error patterns.
-   [ ] Raw physical response data saved if hardware testing is
    possible.
-   [ ] Metrics calculated from actual data.
-   [ ] Cross-device uniqueness only claimed if independent devices were
    tested.
-   [ ] Modelling attack methodology documented if attempted.
-   [ ] Resource, timing, and power figures identify their measurement
    method.

## Presentation and reproducibility

-   [ ] Problem and practical use explained.
-   [ ] Circuit architecture and signal sequence explained.
-   [ ] Live or recorded demonstration prepared.
-   [ ] Paper-reported values separated from project results.
-   [ ] Limitations and future work included.
-   [ ] Source, scripts, raw data, and report organised in a repository.

------------------------------------------------------------------------

# 16. First instruction to the coding agent

Start by doing the following, in order:

1.  Inspect the current workspace and list all files.
2.  Create `README.md`, `PROJECT_SPEC.md`, `docs/`, `rtl/`, `sim/`,
    `constraints/`, `scripts/`, `data/`, `results/`, `reports/`, and
    `presentation/`.
3.  Put this specification in `PROJECT_SPEC.md`.
4.  Create `docs/paper_notes.md` with a traceability table: paper
    claim/figure/section, implementation requirement, verification
    method, status, and open question.
5.  Create a list of questions that must be answered before
    FPGA-specific core code is finalised, especially the board model,
    tool version, supported primitives, and physical constraints.
6.  Do not yet invent FPGA pin assignments, primitive names for a
    different family, physical constraints, or timing numbers.
7.  After the user supplies the board model/toolchain, propose the exact
    implementation strategy and module interfaces.
8.  Implement one module at a time, include tests, and keep the design's
    physical limitations visible in all documentation.

**Definition of done:** The final result should be a reproducible,
documented implementation and evaluation of the CBDC-PUF framework to
the maximum extent the actual hardware allows---not just a simulation,
not fabricated measurements, and not a generic PUF substituted for the
paper's design.
