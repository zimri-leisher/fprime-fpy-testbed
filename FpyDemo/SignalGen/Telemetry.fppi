@ Type of the output signal: SINE, TRIANGLE, etc.
telemetry Type: FpyDemo.SignalType id 0

@ Single Y value of the output
telemetry Output: F32 id 1 format "{.4f}"

@ Single (time, value) pair of the signal
telemetry PairOutput: FpyDemo.SignalPair id 2

@ Last 10 Y values of the signal
telemetry History: FpyDemo.SignalSet id 3

@ Last 10 (time, value) pairs of the signal
telemetry PairHistory: FpyDemo.SignalPairSet id 4

@ Composite field of signal information, containing histories, pairs etc
telemetry Info: FpyDemo.SignalInfo id 5

@ DP bytes written
telemetry DpBytes: U32 id 6

@ DP records written
telemetry DpRecords: U32 id 7
