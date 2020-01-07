#!/bin/bash
kind create cluster --name onenode
kind export kubeconfig --name onenode
kubectl get nodes

# delete cluster
# kind delete cluster --name onenode