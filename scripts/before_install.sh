#!/bin/bash
# BeforeInstall script to handle existing files and install Node.js and npm
echo "BeforeInstall phase: Removing existing files to avoid conflicts..."
rm -rf /var/www/html/*

# Install Node.js and npm if not installed
echo "BeforeInstall phase: Installing Node.js and npm if not installed..."
if ! command -v node &> /dev/null
then
    curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
    sudo apt install -y nodejs
fi
