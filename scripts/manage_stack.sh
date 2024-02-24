#!/bin/bash

##############################################################
#                                                            #
#      Author        :  Arindam Tanti                        #
#      Email Address :  iamarindamtanti@gmail.com             #
#                                                            #
#      Description   :  This script helps you to start,      #
#                       stop, update, scale the blogs stack  #
#                       as a service, follow help.           #
##############################################################


set -x  # Enable debugging
set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail # Checks for any pipefails

logfile="./blog.log"

# Help function to display usage instructions
help(){
    echo "Usage: $0 [deploy|stop|update|scale] <stack_name>"
    echo "Commands:"
    echo "  deploy   - Deploy a stack"
    echo "  restart  - Restart a stack"
    echo "  stop     - Stop a stack"
    echo "  update   - Update a stack"
    echo "  scale    - Scale a stack"
    exit 1
}

# Function to deploy a stack
stack_deploy(){
    local stack_name=$1
    img_spec="blogs:$(date +%Y%m%d%H%M%S)"
    # Setting Up the logfile
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Starting Blogs Stack Deploy." | tee -a $logfile

    # Check if Docker is running in Swarm mode
    if docker info | grep -q "Swarm: active"; then
        echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Docker is running in Swarm mode." | tee -a $logfile
        echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Proceeding to Building Container and Deploying Application Stack..." | tee -a $logfile
        
        # Build a new Docker image with the Dockerfile and tag it
        echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Building Container Image [ $img_spec ]" | tee -a $logfile
        cp ../mkdocs_blogs.Dockerfile ../Dockerfile | tee -a $logfile
        docker build -t $img_spec ".." --no-cache | tee -a $logfile
        rm ../Dockerfile
        docker image ls $img_spec | tee -a $logfile

        # Run Docker stack deploy with the specified service file
        echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Deploying Docker Stack: [ $stack_name ]" | tee -a $logfile
        docker stack deploy -c "../blogs-stack.yml" "$stack_name" | tee -a $logfile
        sleep 10 | tee -a $logfile
        docker service ls | grep "blogs:" | tee -a $logfile

        echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Docker Stack [ $stack_name ] Started Successfully." | tee -a $logfile
    else
        echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (ERROR) | Error: Docker is not running in Swarm mode. Please enable Swarm mode to deploy Blogs stacks." | tee -a $logfile
        exit 1
    fi
}

# Function to stop a stack
stop_stack(){
    local stack_name=$1
    
    # Stop the Docker stack
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Stopping Docker Stack: $stack_name" | tee -a $logfile
    docker stack rm "$stack_name" | tee -a $logfile
}

# Function to restart a stack
restart_stack(){
    local stack_name=$1
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Restaring Docker Stack: $stack_name" | tee -a $logfile
    stop_stack $stack_name 
    sleep 5
    stack_deploy $stack_name
}

# Function to update a stack
update_stack(){
    local stack_name=$1
    
    # Update the Docker stack
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Updating Docker Stack: $stack_name" | tee -a $logfile
    docker stack deploy -c "../blogs-stack.yml" "$stack_name" | tee -a $logfile
}

# Function to scale a stack
scale_stack(){
    local stack_name=$1
    local service_name=$2
    local replicas=$3
    
    # Scale the specified service in the Docker stack
    echo "[ $(date +'%d-%m-%Y %H:%M:%S') ] (INFO) | Scaling Service: $service_name in Stack: $stack_name to $replicas replicas" | tee -a $logfile
    docker service scale "$stack_name"_"$service_name"="$replicas" | tee -a $logfile
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
        *)
            help
            ;;
    esac
}

main "$@"