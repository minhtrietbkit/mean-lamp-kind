#!/bin/bash

# Start kind cluster and deploy a MEAN stack app
ROOT_DIR="$(pwd)"

prepare_bin() {
    which kubectl && return
    ## Install kubectl
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    kubectl version

    which kind && return
    ## Install kind
    brew install kind
}

create_cluster() {
    bash "$ROOT_DIR/kind/cluster-creation/create-cluster.sh";    
}

dockerize_app() {
    which ng || npm install -g @angular/cli
    cd "$ROOT_DIR/mean_app"
    npm install && npm run build
    cd "$ROOT_DIR/mean_app/docker" && docker build -t mean-stack-angular-7-crud-app-example . 
}

deploy_app() {
    kubectl apply -f "$ROOT_DIR/kind/app-deployment/mean"
}

test() {
    echo "Deploying should take around 60s..."
    sleep 60s
    echo "Access site via localhost:4000"
    kubectl port-forward deployment/meanapp 4000:4000
}

main() {
    prepare_bin
    create_cluster
    dockerize_app
    deploy_app
    test
}

main
