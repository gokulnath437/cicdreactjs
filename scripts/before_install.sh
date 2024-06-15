#!/bin/bash

# Stop any running Node.js processes
echo "Stopping any running Node.js processes..."
pkill node

# Install Node.js and npm if they are not already installed
echo "Installing Node.js and npm..."
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify installation
echo "Node.js version:"
node -v
echo "npm version:"
npm -v

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -rf /tmp/*

# Additional custom pre-installation tasks can be added here

