#!/bin/bash
echo "================================"
echo "  Talium-tech Server Health Report"
echo "================================"
echo ""
echo "Date: $(date)"
echo "Host: $HOSTNAME"
echo "User: $USER"
echo ""
echo "--- Uptime ---"
uptime
echo ""
echo "--- Memory ---"
free -h
echo ""
echo "--- Disk ---"
df -h /
echo ""
echo "================================"
echo "  All systems checked."
echo "================================"
