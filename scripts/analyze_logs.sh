#!/bin/bash

# ==============================================================================
# Script Name: analyze_logs.sh
# Description: Parses log files to extract error counts and status code summaries.
# Usage: ./analyze_logs.sh <path_to_log_file> [search_pattern]
# ==============================================================================

# 1. Configuration & Input Validation
LOG_FILE=$1
SEARCH_PATTERN=${2:-"ERROR"} # Defaults to "ERROR" if not provided

# Check if an argument was provided
if [[ -z "$LOG_FILE" ]]; then
    echo "Error: Missing log file path."
    echo "Usage: $0 <path_to_log_file> [search_pattern]"
    exit 1
fi

# Check if file exists and is readable
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: File '$LOG_FILE' not found."
    exit 1
fi

if [[ ! -r "$LOG_FILE" ]]; then
    echo "Error: Permission denied. Cannot read '$LOG_FILE'."
    exit 1
fi

echo "---------------------------------------------------"
echo "Analyzing: $LOG_FILE"
echo "Searching for: $SEARCH_PATTERN"
echo "---------------------------------------------------"

# 2. Execution Logic
# Task A: Count occurrences of the search pattern
match_count=$(grep -c "$SEARCH_PATTERN" "$LOG_FILE")

# Task B: Extract and count HTTP Status Codes (assumes standard web log format)
# Looks for 3-digit codes preceded by a space and followed by a space/tab
status_summary=$(awk '{for(i=1;i<=NF;i++) if($i ~ /^[2-5][0-9][0-9]$/) print $i}' "$LOG_FILE" | sort | uniq -c | sort -rn)

# 3. Output Results
echo "Total occurrences of '$SEARCH_PATTERN': $match_count"
echo ""
echo "HTTP Status Code Summary:"
if [[ -n "$status_summary" ]]; then
    echo "Count | Status Code"
    echo "$status_summary"
else
    echo "No standard HTTP status codes detected."
fi
echo "---------------------------------------------------"

# 4. Exit Behavior
if [[ $match_count -gt 0 ]]; then
    exit 0 # Success: Pattern found
else
    exit 2 # Success: Script ran, but no patterns found
fi
