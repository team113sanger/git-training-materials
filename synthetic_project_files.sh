#!/bin/bash
# This script is used to generate a directory with synthetic project files 
# for the purpose of training and learnin how to use git commands.
#
# The scipt can be invoked directly from the command line:
#   ./synthetic_project_files.sh
# or
#   ./synthetic_project_files.sh path/to/directory
#
# When no argument is provided, the script creates a directory named "synthetic_project"
# in the current working directory. If a directory path is provided as an argument,
# it creates the synthetic project files in the specified directory.
#
# The directory structure created is as follows:
#
# synthetic_project/
# ├── scripts/
# │   ├── hello_world.py
# │   ├── hello_world.R
# │   └── hello_world.sh
# ├── plots/
# │   ├── <flag1>.png
# │   ├── <flag2>.png
# │   ├── ...
# │   └── <flagX>.png
# ├── data/
# │   ├── blob1.bam
# │   ├── blob2.bam
# │   ├── ...
# │   └── blobN.bam
# ├── results/
# │   ├── summary.txt
# └── analysis/
#     ├── run_caveman.sh
#     └── run_pindel.sh

set -euo pipefail

# NORMAL CONSTANTS (read only variables)
readonly DEFAULT_DIR="SYNTHETIC_PROJECT"
COUNTRY_CODES=(gb fr de es it us ca jp in br)
SAMPLE_BAMS=("PD123a.bam" "PD123b.bam" "PD223a.bam" "PD223b.bam" "PD323a.bam" "PD323b.bam")

# HEREDOC CONSTANTS (using functions for cross-platform compatibility)

function get_hello_world_py() {
  cat << 'EOF'
#!/usr/bin/env python3
print("Hello, World from Python!")
EOF
}

function get_hello_world_r() {
  cat << 'EOF'
#!/usr/bin/env Rscript
cat("Hello, World from R!\n")
EOF
}

function get_hello_world_sh() {
  cat << 'EOF'
#!/bin/bash
echo "Hello, World from Bash!"
EOF
}

function get_run_caveman_sh() {
  cat << 'EOF'
#!/bin/bash
echo "Running CaVEMan analysis..."
echo "Analysis complete!"
EOF
}

function get_run_pindel_sh() {
  cat << 'EOF'
#!/bin/bash
echo "Running Pindel analysis..."
echo "Analysis complete!"
EOF
}

function get_summary_txt() {
  cat << 'EOF'
Analysis Summary Report
=======================

Project: Synthetic Project for Git Training
Generated: $(date)

Sample Processing:
- Total samples processed: 6
- BAM files generated: 6
- Flags downloaded: 10

Analysis Tools:
- CaVEMan: Completed
- Pindel: Completed

Results:
All synthetic data has been successfully generated.
This is a training dataset for learning Git workflows.
EOF
}

# GLOBAL VARIABLES
TARGET_DIR=""

# FUNCTIONS


function download_flag() {
  local code="$1"
  local dir="$2"
  mkdir -p "$dir"
  curl -fsS "https://flagcdn.com/80x60/${code}.png" -o "${dir}/${code}.png"
}

function parse_args() {
  if [ "$#" -eq 0 ]; then
    TARGET_DIR="$DEFAULT_DIR"
  else
    TARGET_DIR="$1"
  fi
}

function main() {
  echo "Creating synthetic project in: $TARGET_DIR"

  # Create directory structure
  mkdir -p "$TARGET_DIR"/{scripts,plots,data,results,analysis}

  # Create script files
  get_hello_world_py > "$TARGET_DIR/scripts/hello_world.py"
  get_hello_world_r > "$TARGET_DIR/scripts/hello_world.R"
  get_hello_world_sh > "$TARGET_DIR/scripts/hello_world.sh"
  chmod +x "$TARGET_DIR/scripts/"*

  # Create analysis scripts
  get_run_caveman_sh > "$TARGET_DIR/analysis/run_caveman.sh"
  get_run_pindel_sh > "$TARGET_DIR/analysis/run_pindel.sh"
  chmod +x "$TARGET_DIR/analysis/"*

  # Create results file
  get_summary_txt > "$TARGET_DIR/results/summary.txt"

  # Download flag images
  echo "Downloading flag images..."
  for code in "${COUNTRY_CODES[@]}"; do
    download_flag "$code" "$TARGET_DIR/plots" || echo "Warning: Failed to download flag for $code"
  done

  # Generate large BAM files (110MB+ each of random data)
  echo "Generating large BAM files..."
  for bam in "${SAMPLE_BAMS[@]}"; do
    echo "Creating $bam (110MB)..."
    dd if=/dev/urandom of="$TARGET_DIR/data/$bam" bs=1M count=110 status=none
  done

  echo "Synthetic project created successfully in $TARGET_DIR"
}

# MAIN SCRIPT EXECUTION
parse_args "$@"
main