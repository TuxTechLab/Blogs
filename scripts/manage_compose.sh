#!/bin/bash

##############################################################
#                                                            #
#      Author        :  Arindam Tanti                        #
#      Email Address :  iamarindamtanti@gmail.com            #
#                                                            #
#      Description   :  This script helps you to start,      #
#                       stop, update, and scale the blogs    #
#                       stack using Docker Compose. Follow   #
#                       help for usage instructions.         #
##############################################################

# Disabled debugging by-default.
# Enable it by uncomment the below line and start debug mode.
# set -x
# Exit immediately if a command exits with a non-zero status
# set -e # Disabled Exit on Error to capture errors.
set -o pipefail # Checks for any pipe failures

logfile="../logs/blog-compose-$(date +'%d-%m-%Y').log"

# Help function to display usage instructions
help(){
    echo "Usage: $0 [deploy|stop|update|scale|restart] <compose_file> <service_name> [replicas]"
    echo "Commands:"
    echo "  deploy   - Deploy Docker Compose"
    echo "  restart  - Restart Docker Compose"
    echo "  stop     - Stop Docker Compose"
    echo "  update   - Update Docker Compose"
    echo "  scale    - Scale Docker Compose"
    echo ""
    echo "EXAMPLES: "
    echo ""
    echo "1. Deploy        - bash manage_compose.sh deploy <compose-file.yml>"
    echo "2. Restart       - bash manage_compose.sh restart <compose-file.yml>"
    echo "3. Stop          - bash manage_compose.sh stop <compose-file.yml>"
    echo "4. Update        - bash manage_compose.sh update <compose-file.yml>"
    echo "5. Scale Up/Down - bash manage_compose.sh scale <compose-file.yml> <service-name> <replicas>"
    exit 1
}

# Function to deploy a stack
deploy_compose(){
    local compose_file=$1
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Starting Docker Compose Deploy: $compose_file." | tee -a $logfile

    # Deploy the Docker Compose stack
    docker-compose -f "$compose_file" up -d | tee -a $logfile
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Docker Compose Stack Deployed Successfully." | tee -a $logfile
}

# Function to stop a stack
stop_compose(){
    local compose_file=$1
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Stopping Docker Compose Stack: $compose_file" | tee -a $logfile
    docker-compose -f "$compose_file" down | tee -a $logfile
}

# Function to restart a stack
restart_compose(){
    local compose_file=$1
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Restarting Docker Compose Stack: $compose_file" | tee -a $logfile
    stop_stack $compose_file 
    sleep 5
    stack_deploy $compose_file
}

# Function to update a stack
update_compose(){
    local compose_file=$1
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Updating Docker Compose Stack: $compose_file" | tee -a $logfile
    docker-compose -f "$compose_file" pull | tee -a $logfile
    docker-compose -f "$compose_file" up -d | tee -a $logfile
}

# Function to scale a stack
scale_compose(){
    local compose_file=$1
    local service_name=$2
    local replicas=$3
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Scaling Service: $service_name in Stack: $compose_file to $replicas replicas" | tee -a $logfile
    docker-compose -f "$compose_file" up -d --scale "$service_name"="$replicas" | tee -a $logfile
}

# Function to list running stacks
list_composes(){
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Listing All Docker Composes" | tee -a $logfile
    docker compose ls |  tee -a $logfile
}

# Main function to parse command-line arguments and execute corresponding functions
main(){
    if [ $# -lt 1 ]; then
        help
    fi
    
    local command=$1
    local compose_file=$2
    
    case "$command" in
        deploy)
            deploy_compose "$compose_file"
            ;;
        stop)
            stop_compose "$compose_file"
            ;;
        restart)
            restart_compose "$compose_file"
            ;;
        update)
            update_compose "$compose_file"
            ;;
        scale)
            if [ $# -ne 4 ]; then
                help
            fi
            local service_name=$3
            local replicas=$4
            scale_compose "$compose_file" "$service_name" "$replicas"
            ;;
        list)
            list_composes
            ;;
        *)
            help
            ;;
    esac
}

main "$@"
