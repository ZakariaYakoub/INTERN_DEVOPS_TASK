#!/bin/bash

# The name of the cluste
CLUSTER_NAME="mycluster"

# Here we check if the cluster already exists, if it does exists with the same name , we delete it 
if kind get clusters | grep -q "$CLUSTER_NAME"; then
  echo "Deleting existing cluster: $CLUSTER_NAME"
  kind delete cluster --name "$CLUSTER_NAME"
fi

# Here we create the kind cluster
kind create cluster --name "$CLUSTER_NAME"