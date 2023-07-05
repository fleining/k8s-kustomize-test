#!/usr/bin/env bash
exit

#
kubectl apply -k base/

# 
kustomize build overlays/dev/
