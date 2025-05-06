#!/bin/bash

##############################################################
#                                                            #
#      Author        :  TuxTechLab.com                       #
#      Email Address :  root.tuxtechlab@gmail.com            #
#                                                            #
#      Description   :  This script helps you to start,      #
#                       stop, update, scale the blogs stack  #
#                       as a service, follow help.           #
##############################################################

# Disabled debugging by-default.
# Enable it by uncomment the below line and start debug mode.
# set -x
# Exit immediately if a command exits with a non-zero status
# set -e # Disabled Exit on Error to capture errors.
set -o pipefail # Checks for any pipefails

logfile="../logs/blog-stack-$(date +'%d-%m-%Y-%H:%M').log"

# Help function to display usage instructions
help(){
    echo "Usage: $0 [deploy|stop|update|scale] <stack_name>"
    echo "Commands:"
    echo "  deploy   - Deploy a stack"
    echo "  restart  - Restart a stack"
    echo "  stop     - Stop a stack"
    echo "  update   - Update a stack"
    echo "  scale    - Scale a stack"
    echo ""
    echo "EXAMPLES: "
    echo ""
    echo "1. Deploy        - bash manage_stack.sh deploy <new-stack-name>"
    echo "2. Restart       - bash manage_stack.sh restart <existing-stack-name>"
    echo "3. Stop          - bash manage_stack.sh stop <existing-stack-name>"
    echo "4. Update        - bash manage_stack.sh update <existing-stack-name>"
    echo "4. Scale Up/Down - bash manage_stack.sh  <existing-stack-name>"
    exit 1
}

logger(){
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] | $1" | tee -a $logfile
}

# Function to deploy a stack
stack_deploy(){
    local stack_name=$1
    img_spec="blogs:$(date +%Y%m%d-%H-%M-%S)"
    # Setting Up the logfile
    logger "(INFO) | Starting Blogs Stack Deploy."

    # Check if Docker is running in Swarm mode
    if docker info | grep -q "Swarm: active"; then
        logger "(INFO) | Docker is running in Swarm mode."
        logger "(INFO) | Proceeding to Building Container and Deploying Application Stack..."
        
        # Build a new Docker image with the Dockerfile and tag it
        logger "(INFO) | Building Container Image [ $img_spec ]"
        cp ../mkdocs_blogs.Dockerfile ../Dockerfile
        docker build -t $img_spec ".." --no-cache
        rm ../Dockerfile
        docker image ls $img_spec

        # Run Docker stack deploy with the specified service file
        logger "(INFO) | Deploying Docker Stack: [ $stack_name ]"
        docker stack deploy -c "../blogs-stack.yml" "$stack_name"
        sleep 10
        docker service ls | grep "blogs:"

        logger "(INFO) | Docker Stack [ $stack_name ] Started Successfully."
    else
        logger "(ERROR) | Error: Docker is not running in Swarm mode. Please enable Swarm mode to deploy Blogs stacks."
        exit 1
    fi
}

# Function to stop a stack
stop_stack(){
    local stack_name=$1
    
    # Stop the Docker stack
    logger "(INFO) | Stopping Docker Stack: $stack_name"
    docker stack rm "$stack_name"
}

# Function to restart a stack
restart_stack(){
    local stack_name=$1
    logger "(INFO) | Restaring Docker Stack: $stack_name"
    stop_stack $stack_name 
    sleep 5
    stack_deploy $stack_name
}

# Function to update a stack
update_stack(){
    # Use This When you have done changes on the stack/ docker image. This will help to update
    # the whole stack using a single command

    local stack_name=$1
    
    # Update the Docker stack
    logger "(INFO) | Updating Docker Stack: $stack_name"
    docker stack deploy -c "../blogs-stack.yml" "$stack_name"
}

# Function to scale a stack
scale_stack(){
    local stack_name=$1
    local service_name=$2
    local replicas=$3
    
    # Scale the specified service in the Docker stack
    logger "(INFO) | Scaling Service: $service_name in Stack: $stack_name to $replicas replicas"
    docker service scale "$stack_name"_"$service_name"="$replicas"
}

# Function to list running stacks
list_stacks(){
    logger "(INFO) | Listing All running Docker Stacks:"
    docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
}

# Main function to parse command-line arguments and execute corresponding functions
main(){
    if [ $# -lt 1 ]; then
        help
    fi
    
    local command=$1
    local stack_name=$2
    
    case "$command" in
        deploy)
            stack_deploy "$stack_name"
            ;;
        stop)
            stop_stack "$stack_name"
            ;;
        restart)
            restart_stack "$stack_name"
            ;;
        update)
            update_stack "$stack_name"
            ;;
        scale)
            service_name=$3
            replicas=$4
            scale_stack "$stack_name" "$service_name" "$replicas"
            ;;
        list)
            list_stacks
            ;;
        *)
            help
            ;;
    esac
}

main "$@"