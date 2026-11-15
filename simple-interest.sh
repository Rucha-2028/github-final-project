#!/bin/bash

# Simple Interest Calculator

echo "=================================="
echo "       Simple Interest Calculator"
echo "=================================="

# Get input from the user
read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (%): " rate
read -p "Enter the time period (in years): " time

# Validate the inputs
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid positive numeric values."
    exit 1
fi

# Calculate simple interest and total amount
awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {
    si = (p * r * t) / 100
    total = p + si

    printf "\nSimple Interest = %.2f\n", si
    printf "Total Amount = %.2f\n", total
}'

echo "=================================="
echo "       Calculation Completed"
echo "=================================="
