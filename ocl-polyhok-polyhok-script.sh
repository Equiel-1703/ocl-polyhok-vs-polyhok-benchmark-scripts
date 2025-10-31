#!/bin/bash

RUNS_PER_BENCHMARK=1 # CHANGE TO 30 LATER ----------------------------------------------------<<<

# Define directories for benchmarks
BENCHMARKS_DIR="benchmarks"

# --- Functions for running benchmarks ---
run_elixir_benchmark() {
    local benchmark_name="$1"
    local benchmark_input="$2"

    local i # Loop variable

    for ((i=1; i<=RUNS_PER_BENCHMARK; i++)); do
        mix run $BENCHMARKS_DIR/$benchmark_name $benchmark_input 2>&1
    done
}

# ------------------ Script Start ------------------
echo -e "- $(basename "$PWD") Benchmarks Results -"
date
echo -e "Tests conducted by: Andre R. Du Bois & Henrique G. Rodrigues\n"
echo -e "Runs per benchmark: $RUNS_PER_BENCHMARK\n"
echo ""  # Add a blank line for readability

# ------------------ Dot Product Benchmark ------------------
INPUTS="1024 2048 4096" # Test values
# INPUTS="400000 600000 800000" # CHANGE TO THIS LATER ----------------------------------------------------<<<

echo -e "Dot Product (DP) benchmark\n"

BENCH="dot_product.ex"
for INPUT in $INPUTS; do
    run_elixir_benchmark "$BENCH" "$INPUT"
done
echo "" 

# ------------------ Julia Benchmark ------------------
INPUTS="7424 9472 11520"

echo -e "Julia (JL) benchmark\n" 

BENCH="julia.ex"
for INPUT in $INPUTS; do
    run_elixir_benchmark "$BENCH" "$INPUT"
done
echo "" 

# ------------------ MM Benchmarks ------------------
INPUTS="128 256 512" # Test values
# INPUTS="11000 13000 15000" # CHANGE TO THIS LATER ----------------------------------------------------<<<

echo -e "Matrix Multiplication (MM) benchmark\n" 

BENCH="mm.ex"
for INPUT in $INPUTS; do
    run_elixir_benchmark "$BENCH" "$INPUT"
done
echo "" 

# ------------------ NBody Benchmarks ------------------
INPUTS="128 256 512" # Test values
# INPUTS="600000 800000 1000000" # CHANGE TO THIS LATER ----------------------------------------------------<<<

echo -e "nBodies (NB) benchmark\n" 

BENCH="nbodies.ex"
for INPUT in $INPUTS; do
    run_elixir_benchmark "$BENCH" "$INPUT"
done
echo ""

# ------------------ Nearest Neighbor Benchmarks ------------------
INPUTS="1024 2048 4096" # Test values
# INPUTS="100000 200000 300000" # CHANGE TO THIS LATER ----------------------------------------------------<<<

echo -e "Nearest Neighbor (NN) benchmark\n" 

BENCH="nearest_neighbor.ex"
for INPUT in $INPUTS; do
    run_elixir_benchmark "$BENCH" "$INPUT"
done
echo ""

# ------------------ Raytracer Benchmarks ------------------
INPUTS="7424 9472 11520"

echo -e "Raytracer (RT) benchmark\n" 

BENCH="raytracer.ex"
for INPUT in $INPUTS; do
    run_elixir_benchmark "$BENCH" "$INPUT"
done
echo "" 

# ------------------ Script End ------------------
