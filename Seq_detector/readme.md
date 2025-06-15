
Design a configurable 4-bit sequence detector that detects a specific 4-bit binary pattern input via a serial bit stream.

The pattern should be configurable via an input port.

Input stream comes in one bit per clock cycle.

On detecting the configured pattern, assert an output signal pattern_found for one clock cycle.

🔧 Inputs:
clk, rstn — Clock and active-low reset

pattern [3:0] — 4-bit pattern to detect (e.g., 4'b1011)

data_in — serial data input (1-bit per cycle)

🔦 Output:
pattern_found — 1 when pattern is matched, 0 otherwise (asserted for one clock cycle only)
