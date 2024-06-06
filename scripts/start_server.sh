#!/bin/bash
# Start the server
cd /var/www/html
npm install -g serve
serve -s build -l 3000 &
