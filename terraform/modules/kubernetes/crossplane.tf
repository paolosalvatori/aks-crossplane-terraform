resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane"
  namespace        = "crossplane-system"
  create_namespace = true
  timeout          = 1200

  set {
    name  = "provider.packages"
    value = "{${join(",", var.crossplane_provider_packages)}}"
  }
}

resource "kubectl_manifest" "crossplane_provider_config" {
  yaml_body = <<-EOF
    apiVersion: azure.upbound.io/v1beta1
    kind: ProviderConfig
    metadata:
      name: default
    spec:
      credentials:
        source: UserAssignedManagedIdentity
      clientID: ${var.kubelet_identity_client_id}
      subscriptionID: ${var.subscription_id}
      tenantID: ${var.tenant_id}
    EOF

  depends_on = [helm_release.argocd]
}