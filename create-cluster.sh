#!/bin/bash

# Start kind cluster and install necessary binaries
ROOT_DIR="$(pwd)"
APP="$1"

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

main() {
    prepare_bin
    create_cluster
}

main
