name_prefix                              = "Galaga"
domain                                   = "babosbird.com"
kubernetes_version                       = "1.28.3"  
ssh_public_key                           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDRHrICSTesKCNyH6vN4K3YwhDUO89cqnEDz2bcZ0sLn9mU6hwyXHna5vME8Y/A8Jbj4XiMyePbAJsX8R/Yyq5pZSiqYpPqSdRGOGqKxQPMBE8WFN1RZmrbrb0ElVQtdWWhlCis4PyMn76fbH6Q8zf/cPzzm9GTimVw62BGhdqdHHru7Sy3I+WRGVA3Z2xHqpda+4nd9LYQW3zkHP98TbIM5OW8kVhRUtmg3c0tOViU6CsGP9w4FU8TU7wLWoeig69kv6UgikwnJYXkItiLecCbVqOeGwbHZQmawcqEY674E3jgJkJ5nQVblCODR0ODNCtrCDVyT6pX0Hdt1ivIpkf"
vm_enabled                               = true
location                                 = "northeurope"
admin_group_object_ids                   = ["4e4d0501-e693-4f3e-965b-5bec6c410c03"]
web_app_routing_enabled                  = true
dns_zone_name                            = null
dns_zone_resource_group_name             = null
grafana_admin_user_object_id             = "0c5267b2-01f3-4a59-970e-0d9218d5412e"
vnet_integration_enabled                 = true
crossplane_provider_packages             = ["xpkg.upbound.io/upbound/provider-azure-managedidentity:v0.42.0",
                                            "xpkg.upbound.io/upbound/provider-azure-keyvault:v0.42.0",
                                            "xpkg.upbound.io/upbound/provider-azure-storage:v0.42.0",
                                            "xpkg.upbound.io/upbound/provider-azure-network:v0.42.0",
                                            "xpkg.upbound.io/upbound/provider-azure-containerregistry:v0.42.0",
                                            "xpkg.upbound.io/upbound/provider-azure-compute:v0.42.0"]
openai_enabled                           = false