#!/bin/bash
# BeforeInstall script to handle existing files and install Node.js and npm
echo "BeforeInstall phase: Removing existing files to avoid conflicts..."
#rm -rf /var/www/html/*

# Install Node.js and npm if not installed
echo "BeforeInstall phase: Installing Node.js and npm if not installed..."
if ! command -v node &> /dev/null
then
    curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
    sudo apt install -y nodejs
fi

#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error and exit immediately
set -o pipefail  # Return the exit status of the last command in the pipe that failed

# Function to log messages
log_message() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log_message "Starting cleanup script..."

# Define the path to the CodeDeploy deployment root
DEPLOYMENT_ROOT="/opt/codedeploy-agent/deployment-root/c4aa9ce1-dc08-42e6-8349-6f47d71a256e"

# Ensure the deployment root directory exists
if [ -d "$DEPLOYMENT_ROOT" ]; then
  # Get a list of all deployment directories sorted by modification time, newest first
  DEPLOYMENT_DIRS=$(ls -1t $DEPLOYMENT_ROOT)

  # Convert the list to an array
  DEPLOYMENT_ARRAY=($DEPLOYMENT_DIRS)

  # Print debug information
  log_message "All deployment directories: ${DEPLOYMENT_ARRAY[@]}"

  # Calculate the number of directories to delete (keep the last two) #1
  NUM_TO_DELETE=$((${#DEPLOYMENT_ARRAY[@]} - 1))

  # Print debug information
  log_message "Number of directories to delete: $NUM_TO_DELETE"

  # If there are directories to delete, delete them
  if [ $NUM_TO_DELETE -gt 0 ]; then
    for ((i=1; i<$NUM_TO_DELETE+1; i++)); do
      DIR_TO_DELETE="$DEPLOYMENT_ROOT/${DEPLOYMENT_ARRAY[$i]}"
      rm -rf "$DIR_TO_DELETE"
      log_message "Deleted old deployment directory: $DIR_TO_DELETE"
    done
  fi
else
  log_message "Deployment root directory does not exist: $DEPLOYMENT_ROOT"
fi

# Optionally, clear old logs if necessary
LOG_PATH="/var/log/aws/codedeploy-agent/"
find "$LOG_PATH" -type f -mtime +30 -exec rm -f {} +
log_message "Cleared old logs in $LOG_PATH"

log_message "Cleanup complete. All deployments except the last two have been removed." buildspec for only last two deployments




