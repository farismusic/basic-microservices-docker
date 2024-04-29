#!/bin/bash

#As provided in the email
function run_test {
    echo "Running tests..."
    bash <(curl -s https://raw.githubusercontent.com/kkenan/basic-microservices/master/health_check.sh)
}

function start_app {
    echo "Starting the application..."
    docker compose up -d
}

function stop_app {
    delete_volumes="$2"
    if [ -n "$delete_volumes" ]; then
      if [ "$delete_volumes" == "--delete-volumes" ]; then
        echo "Stopping the application..."
        docker compose down -v
      else
        echo "Unknown flag $delete_volumes"
      fi
    elif [ -z "$delete_volumes" ]; then
      echo "Stopping the application..."
        docker compose down
    fi
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 {test|start|stop [--delete-volumes]}"
    exit 1
fi

case "$1" in
    test)
        run_test
        ;;
    start)
        start_app
        ;;
    stop)
        stop_app "$@"
        ;;
    *)
        echo "Invalid argument: $1"
        echo "Usage: $0 {test|start}"
        exit 1
        ;;
esac

exit 0