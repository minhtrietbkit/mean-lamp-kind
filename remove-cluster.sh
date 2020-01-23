#!/bin/bash

#Remove cluster
ROOT_DIR="$(pwd)"

create_cluster() {
    bash "$ROOT_DIR/kind/cluster-creation/remove-cluster.sh";    
}

main() {
    create_cluster
}

main