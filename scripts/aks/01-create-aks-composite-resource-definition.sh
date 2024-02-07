#!/bin/bash

# For more information, see the Crossplane documentation and marketplace:
# https://crossplane.io/docs/v1.3/getting-started/install-configure.html#install-crossplane
# https://docs.crossplane.io/latest/getting-started/provider-azure-part-2/
# https://marketplace.upbound.io/providers?query=azure
# https://github.com/upbound/configuration-azure-aks/tree/main
# https://marketplace.upbound.io/providers/crossplane-contrib/provider-kubernetes/v0.11.4
# https://marketplace.upbound.io/providers/crossplane-contrib/provider-helm/v0.16.0


# Create the CompositeResourceDefinition for the AKS resource
kubectl apply -f aks-composite-resource-definition.yaml