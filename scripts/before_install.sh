#!/bin/bash
# Script for before install phase

# Example: Stop the server if running
echo "Stopping the server if running..."
systemctl stop myapp.service || true
