#!/bin/bash

# Start kind cluster and deploy a MEAN stack app
ROOT_DIR="$(pwd)"
APP="$1"

dockerize_app() {
    which ng || npm install -g @angular/cli
    cd "$ROOT_DIR/mean_app"
    npm install && npm run build
    cd "$ROOT_DIR/mean_app/docker" && docker build -t mean-stack-angular-7-crud-app-example . 
}

deploy_app() {
    kubectl apply -f "$ROOT_DIR/kind/app-deployment/$APP"
}

test() {
    echo "Wait for 2 containers to change status to RUNNING. Then run following command in another terminal"
    case $APP in
        mean)
            echo "kubectl port-forward deployment/meanapp 4000:4000"
            echo "Then access test site at http://localhost:4000 via browser"
            ;;
        lamp)
            echo "kubectl port-forward deployment/lampapp 8080:80"
            echo "Then access test site at http://localhost:8080 via browser"
            ;;
    esac    
    kubectl get --watch pods -o wide
}

main() {
    deploy_app
    test
}

main
