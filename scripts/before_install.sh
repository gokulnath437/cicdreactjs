#!/bin/bash
# Stop the server if it's running
pkill serve || true
# Ensure the correct directory exists
mkdir -p /var/www/html
