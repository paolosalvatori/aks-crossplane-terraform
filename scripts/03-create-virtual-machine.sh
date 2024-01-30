#!/bin/bash

# For more information, see the Crossplane documentation and marketplace:
# https://crossplane.io/docs/v1.3/getting-started/install-configure.html#install-crossplane
# https://docs.crossplane.io/latest/getting-started/provider-azure-part-2/
# https://marketplace.upbound.io/providers?query=azure

# Variables
name="bingo"
location="EU"

# With the custom API (XRD) installed and associated to a resource template (Composition) users can access the API to create resources.
# Create a VirtualMachine object to create the cloud resources.
cat <<EOF | kubectl apply -f -
apiVersion: compute.example.com/v1alpha1
kind: VirtualMachine
metadata:
  name: $name
spec: 
  location: $location
EOF