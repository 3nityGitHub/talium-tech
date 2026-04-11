#!/bin/bash
A=10
B=3

echo "Add: $((A + B))"
echo "Subtract: $((A - B))"
echo "Multiply: $((A * B))"
echo "Divide: $((A / B))"
echo "Remainder: $((A % B))"

# Increment a counter
COUNTER=0
COUNTER=$((COUNTER + 1))
echo "Counter: $COUNTER"
