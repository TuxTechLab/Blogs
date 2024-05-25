
#!/bin/bash

#################################################################
#                                                               #
#      Author        :  Arindam Tanti                           #
#      Email Address :  arindamtanti123@gmail.com               #
#                                                               #
#      Description   :  This script validates the environment   #
#                       for Docker Swarm, Python3, Poetry,      #
#                       and internet access.                    #
#                                                               #
#################################################################

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail # Checks for any pipe failures

logfile="../logs/blog-validation-$(date +'%d-%m-%Y').log"

# Function to log messages
log() {
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] $1" | tee -a $logfile
}

# Help function to display usage instructions
help() {
    echo "Usage: $0 [--help]"
    echo ""
    echo "This script validates the environment for Docker Swarm, Python3, Poetry, and internet access."
    echo ""
    echo "Options:"
    echo "  --help    Show this help message and exit"
    echo ""
    echo "Examples:"
    echo "  ./validate_environment.sh          # Run the validation checks"
    echo "  ./validate_environment.sh --help   # Display this help message"
    exit 0
}

# Check if --help is passed as an argument
if [ "$1" == "--help" ]; then
    help
fi

# Check if Docker is installed
log "(INFO) | Checking if Docker is installed..."
if ! command -v docker &> /dev/null; then
    log "(ERROR) | Docker is not installed. Please install Docker."
    exit 1
else
    log "(INFO) | Docker is installed."
fi

# Check if Docker is running
log "(INFO) | Checking if Docker is running..."
if ! docker ps -a; then
    log "(ERROR) | Docker is not running. Please start Docker."
    exit 1
else
    log "(INFO) | Docker is running."
fi

# Check if Docker is in Swarm mode
log "(INFO) | Checking if Docker is in Swarm mode..."
if ! docker info | grep -q "Swarm: active"; then
    log "(ERROR) | Docker is not in Swarm mode. Please enable Swarm mode."
else
    log "(INFO) | Docker is in Swarm mode."
fi

# Check if Python3 is installed
log "(INFO) | Checking if Python3 is installed..."
if ! command -v python3 &> /dev/null; then
    log "(ERROR) | Python3 is not installed. Please install Python3."
    exit 1
else
    log "(INFO) | Python3 is installed."
fi

# Check if Poetry is installed
log "(INFO) | Checking if Poetry is installed..."
if ! command -v poetry &> /dev/null; then
    log "(ERROR) | Poetry is not installed. Please install Poetry."
    exit 1
else
    log "(INFO) | Poetry is installed."
fi

# Check internet access
log "(INFO) | Checking internet access..."
if ! ping -c 1 google.com &> /dev/null; then
    log "(ERROR) | No internet access. Please check your network connection."
    exit 1
else
    log "(INFO) | Internet access is available."
fi

log "(INFO) | All validations passed successfully."
