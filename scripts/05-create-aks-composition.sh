#!/bin/bash

# For more information, see the Crossplane documentation and marketplace:
# https://crossplane.io/docs/v1.3/getting-started/install-configure.html#install-crossplane
# https://docs.crossplane.io/latest/getting-started/provider-azure-part-2/
# https://marketplace.upbound.io/providers?query=azure

# Create the Composition for the Aks resource
cat <<EOF | kubectl apply -f -
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata:
  name: aks-with-virtual-network
spec:
  patchSets:
    - name: location-patch
      patches:
      - type: FromCompositeFieldPath
        fromFieldPath: "spec.location"
        toFieldPath: "spec.forProvider.location"
        transforms:
          - type: map
            map: 
              EU: "North Europe"
              US: "East US"
  resources:
    - name: aks-cluster
      base:
        apiVersion: containerservice.azure.upbound.io/v1beta1
        kind: KubernetesCluster
        spec:
          forProvider:
            defaultNodePool:
              - name: default
                nodeCount: 3
                vmSize: Standard_F8s_v2
                enableAutoScaling: true
                minCount: 3
                maxCount: 5
                maxPods: 30
                osDiskSizeGB: 30
                type: VirtualMachineScaleSets
                vnetSubnetIdSelector:
                  matchControllerRef: true
            dnsPrefix: galaga
            identity:
              - type: SystemAssigned
            location: West Europe
            resourceGroupNameSelector:
              matchControllerRef: true
            roleBasedAccessControlEnabled: true
            azureActiveDirectoryRoleBasedAccessControl:
              - adminGroupObjectIds:
                  - 4e4d0501-e693-4f3e-965b-5bec6c410c03
                azureRbacEnabled: true
                managed: true
            azurePolicyEnabled: true
            networkProfile:    
              - dnsServiceIp: 172.16.0.10
                networkPlugin: azure
                serviceCidr: 172.16.0.0/16
            tags:
              Environment: Production
      patches:
        - type: PatchSet
          patchSetName: location-patch      
    - name: default-subnet
      base:
        apiVersion: network.azure.upbound.io/v1beta1
        kind: Subnet
        spec:
          forProvider:
            addressPrefixes:
              - 10.0.0.0/16
            virtualNetworkNameSelector:
              matchControllerRef: true
            resourceGroupNameSelector:
              matchControllerRef: true
    - name: virtual-network
      base:
        apiVersion: network.azure.upbound.io/v1beta1
        kind: VirtualNetwork
        spec:
          forProvider:
            addressSpace:
              - 10.0.0.0/8
            location: "Central US"
            resourceGroupNameSelector:
              matchControllerRef: true
      patches:
        - type: PatchSet
          patchSetName: location-patch
    - name: aks-resourcegroup
      base:
        apiVersion: azure.upbound.io/v1beta1
        kind: ResourceGroup
        spec:
          forProvider:
            location: Central US
      patches:
        - type: PatchSet
          patchSetName: location-patch
  compositeTypeRef:
    apiVersion: compute.example.com/v1alpha1
    kind: AksCluster
EOF
