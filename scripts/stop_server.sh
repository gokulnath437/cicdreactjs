#!/bin/bash
# Stop the server
echo "Stopping the server"

# Attempt to kill the server process and capture the status
if pkill -f serve; then
  echo "Server stopped successfully."
else
  echo "No matching server process found or failed to stop the server."
fi
