#!/bin/bash

# For more information, see the Crossplane documentation and marketplace:
# https://crossplane.io/docs/v1.3/getting-started/install-configure.html#install-crossplane
# https://docs.crossplane.io/latest/getting-started/provider-azure-part-2/
# https://marketplace.upbound.io/providers?query=azure

# Create the CompositeResourceDefinition for the VirtualMachine resource
cat <<EOF | kubectl apply -f -
apiVersion: apiextensions.crossplane.io/v1
kind: CompositeResourceDefinition
metadata:
  name: virtualmachines.compute.example.com
spec:
  group: compute.example.com
  names:
    kind: VirtualMachine
    plural: virtualmachines
  versions:
  - name: v1alpha1
    schema:
      openAPIV3Schema:
        type: object
        properties:
          spec:
            type: object
            properties:
              location:
                type: string
                oneOf:
                  - pattern: '^EU$'
                  - pattern: '^US$'
            required:
              - location
    served: true
    referenceable: true
  claimNames:
    kind: VirtualMachineClaim
    plural: virtualmachineclaims
EOF
