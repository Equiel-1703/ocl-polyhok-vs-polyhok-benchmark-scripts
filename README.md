# OCL-PolyHok vs PolyHok Benchmark Scripts 

These scripts runs GPU benchmarks for testing and comparing the performance of OCL-PolyHok (OpenCL) and PolyHok (CUDA) DSLs implementations. We also use pure CUDA code implementations as a baseline for comparison. The CUDA benchmarks can be run using the separate script `cuda-script.sh`.

## Requirements

- Elixir 1.17
- Erlang/OTP 27
- CUDA-compatible GPU (for PolyHok and CUDA benchmarks)
- OpenCL 2.0 compatible GPU (for OCL-PolyHok benchmarks)

## Running OCL-PolyHok/PolyHok Benchmarks

To run the benchmarks, copy the `ocl-polyhok-polyhok-script.sh` script to the OCL-PolyHok or PolyHok folder and run this command in your terminal:

```bash
nohup ./ocl-polyhok-polyhok-script.sh < /dev/null > benchmarks-results.txt 2> stderr.txt &
```

This will execute the benchmarks in the background and redirect the standard output with all the results to `benchmarks-results.txt` and any errors to `stderr.txt`.

The `< /dev/null` part ensures that the script doesn't receive any input from the terminal, it will basically redirect standard input to nothing. This is **TOTALLY NECESSARY**, because if we do not explicitly configure this, nohup will close/ignore stdin. For some reason, this breaks the stdin descriptor in the Erlang VM, causing it to crash even though we are not using stdin at all in the scripts. When the Erlang VM crashes, the whole script stops. However, if we redirect stdin to /dev/null, the Erlang VM works perfectly fine and the script runs without any issues. My guess is that the Erlang VM successfully initializes stdin to null when we do this redirection, making it happy.

## Running CUDA Benchmarks

To run the pure CUDA benchmarks, copy the `cuda-script.sh` script to OCL-PolyHok or PolyHok folder and run this command in your terminal:

```bash
nohup ./cuda-script.sh < /dev/null > cuda-benchmarks-results.txt 2> cuda-stderr.txt &
```

This command will execute the CUDA benchmarks in the background and redirect the standard output with all the results to `cuda-benchmarks-results.txt` and any errors to `cuda-stderr.txt`.

## Benchmark Details

The script runs each benchmark 30 times to ensure accurate measurements. The benchmarks performed are:

- Dot Product (DP)
- Julia Set (JL)
- Matrix Multiplication (MM)
- nBodies Simulation (NB)
- Nearest Neighbor (NN)
- Ray Tracing (RT)

The input sizes for each benchmark can be verified and adjusted in the script.
