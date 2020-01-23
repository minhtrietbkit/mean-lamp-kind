#!/bin/bash

# Stop specified app
ROOT_DIR="$(pwd)"
APP="$1"

stop_app() {
    kubectl delete -f "$ROOT_DIR/kind/app-deployment/$APP"
}

main() {
    stop_app
}

main
