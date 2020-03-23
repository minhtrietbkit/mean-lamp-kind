#!/bin/bash
kind create cluster --name onenode
export KUBECONFIG=$(kind get kubeconfig-path --name onenode)
kubectl get nodes
