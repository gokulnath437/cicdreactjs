#!/bin/bash
# BeforeInstall script to handle existing files
echo "BeforeInstall phase: Removing existing files to avoid conflicts..."
rm -rf /var/www/html/*
