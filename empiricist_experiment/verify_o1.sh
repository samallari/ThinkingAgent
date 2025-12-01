#!/bin/bash

# Shell script to analyze o1 high and low overthinking scores
# This script:
# 1. Formats raw trajectories using format_message.py
# 2. Analyzes overthinking scores using analyze_overthinking.py with Haiku
# Exit on error
set -e

# change to root directory
cd ..

# Step 1: Format messages. Skipped because already formatted.
# echo "Formatting o1_high_maxiter trajectories..."
# python format_message.py Models/o1_high_maxiter_30_N_v0.20.0-no-hint-run_1

# echo ""
# echo "Formatting o1_low_maxiter trajectories..."
# python format_message.py Models/o1_low_maxiter_30_N_v0.20.0-no-hint-run_1

echo "Formatting gemini_low trajectories..."
python format_message.py Models/gemini-2.5-flash_low_maxiter_10_N_v0.62.0-no-hint-run_1

echo ""
echo "Formatting gemini_high trajectories..."
python format_message.py Models/gemini-2.5-flash_maxiter_10_N_v0.62.0-no-hint-run_1

# Step 2: Analyze overthinking. Rerun these outputs to analyze trajectories that may have been skipped due to rate limit errors.
# echo ""
# echo "Analyzing o1_high_maxiter..."
# python analyze_overthinking.py --model-dir Models/o1_high_maxiter_30_N_v0.20.0-no-hint-run_1 --output empiricist_experiment/my_eval/o1_high_overthinking

# echo ""
# echo "Analyzing o1_low_maxiter..."
# python analyze_overthinking.py --model-dir Models/o1_low_maxiter_30_N_v0.20.0-no-hint-run_1 --output empiricist_experiment/my_eval/o1_low_overthinking

echo ""
echo "Analyzing gemini_low..."
python analyze_overthinking.py --model-dir Models/gemini-2.5-flash_low_maxiter_10_N_v0.62.0-no-hint-run_1 --output empiricist_experiment/my_eval/gemini_low_overthinking

echo ""
# echo "Analyzing gemini_high..."
# python analyze_overthinking.py --model-dir Models/gemini-2.5-flash_maxiter_10_N_v0.62.0-no-hint-run_1 --output empiricist_experiment/my_eval/gemini_high_overthinking

# Summary
echo ""
echo "Done. Rsults saved in empiricist_experiment/my_eval/"
echo ""
