#!/bin/bash

# For more information, see the Crossplane documentation and marketplace:
# https://crossplane.io/docs/v1.3/getting-started/install-configure.html#install-crossplane
# https://docs.crossplane.io/latest/getting-started/provider-azure-part-2/
# https://marketplace.upbound.io/providers?query=azure

# With the custom API (XRD) installed and associated to a resource template (Composition) users can access the API to create resources.
# Create an Aks object to create the cloud resources.
kubectl apply -f aks-composite-resource.yaml