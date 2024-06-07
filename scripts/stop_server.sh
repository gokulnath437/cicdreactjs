#!/bin/bash
# Script to stop the server

# Example: Stop the server
echo "Stopping the server..."
systemctl stop myapp.service || true
