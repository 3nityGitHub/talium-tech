#!/bin/bash
APP="talium-tech"

# Length of string
echo "Length: ${#APP}"

# Uppercase
echo "Upper: ${APP^^}"

# Uppercase first letter
echo "Capitalised: ${APP^}"

# Replace a value
echo "Replace: ${APP/talium/talia}"

# Extract substring — start at position 0, take 6 characters
echo "Substring: ${APP:0:6}"
