## Table of Contents
- [Purpose](#purpose)
- [Usage](#usage)
- [Requirement](#requirement)
- [Association](#association)
- [Maintainers](#maintainers)
- [Contribute](#contribute)

## Purpose 
Terraform template module to add an Azure Virtual Desktop Workspace Association.

## usage
```
Validate all the required variables in variable.tf file,need to get the info of the below variables .
Input Variables 

- wvd_workspace_id
- wvd_application_group_id
## Example

# AVD Resource Group
module "avd_rg" {
  source   = "tfe.optum.com/OCC/IaC-Modules/azurerm//resource-group"
  rg_name  = "avd-poc-rg3"
  location = "centralus"
  tags = {
    client = "occ"
  }
}

# # Create hostpool
module "hostpool" {
  source              = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/host_pool"
  wvd_host_pool_name  = "occavdpool2"
  location            = module.avd_rg.location
  resource_group_name = module.avd_rg.rg_name
  validate_environment= true
  load_balancer_type  = "BreadthFirst"
  tags = {
    client = "occ"
  }
}

# Hostpool Registration
module "hostpool_reg" {
  source          = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/host_pool_reg"
  hostpool_id     = module.hostpool.id
  expiration_date = timeadd(timestamp(), "720h")
    # lifecycle {
    # ignore_changes = [

    #   expiration_date,
    # ]
    # }
}

# # Hostpool Workspace
module "workspace" {
  source              = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/workspace"
  wvd_workspace_name  = "occavdpool2"
  location            = module.avd_rg.location
  resource_group_name = module.avd_rg.rg_name
  friendly_name       = "Primary-workspace-${module.avd_rg.location}"
  tags = {
    client = "occ"
  }
}

# Hostpool Appgroup
module "appgroup" {
  source               = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/application_group"
  wvd_desktop_App_name = "occavdpool"
  location             = module.avd_rg.location
  resource_group_name  = module.avd_rg.rg_name
  type                 = "Desktop"
  host_pool_id         = module.hostpool.id
  default_desktop_display_name  = "OCC Virtual Desktop"
  friendly_name        = "occdev-appgrp"
  tags = {
    client = "occ"
  }
}

#ws_appgrp_association
module "ws_appgrp_association" {
  source                   = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/ws_appgrp_association"
  wvd_workspace_id         = module.workspace.id
  wvd_application_group_id = module.appgroup.id
}


#Vm pool
module "vm_pool" {
  source               = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/avd_vm"
 
  location             = module.avd_rg.location
  resource_group_name  = module.avd_rg.rg_name
  rdsh_count           = 1
  vm_prefix            = "avd-demo"
  vm_size              = "Standard_D4ds_v5"
  vm_publisher         ="MicrosoftWindowsDesktop"
  vm_offer             = "office-365"
  vm_sku               ="win11-21h2-avd-m365"
  vm_version           = "latest"
  subnet_id            = "/subscriptions/69ed4be9-6753-4222-yy-xx/resourceGroups/avd-poc-rg1/providers/Microsoft.Network/virtualNetworks/avd-poc-rg1-vnet/subnets/avd_pool"
  domain_name          = "occdev.local"
  domain_user_upn      = "adadmin"
  ou_path              = "OU=myou,DC=occdev,DC=local"
  domain_user_password = var.adjoinerpassword 
  registration_token   = module.hostpool_reg.registration_info
  host_pool_id         = module.hostpool.id
}



## Deplyoing a secure AVD VM
module "avdvm2"{

  source = ""tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/avd_securevm"
  location             = module.avd_rg.location
  resource_group_name  = module.avd_rg.rg_name
  rdsh_count           = 1
  vm_prefix            = "avdnewvm2"
  vm_size              = "Standard_D4ds_v5"
  # image_id             = data.azurerm_image.prod_avd_image.id
  vm_publisher         = "MicrosoftWindowsDesktop"
  vm_offer             = "Windows-10"
  vm_sku               = "win10-22h2-avd-g2"
  vm_version           = "latest"
  subnet_id            = "/subscriptions/69ed4be9-6753-4222-yy-xx/resourceGroups/avd-poc-rg1/providers/Microsoft.Network/virtualNetworks/avd-poc-rg1-vnet/subnets/avd_pool"

  domain_name          = "occdev.local"
  domain_user_upn      = "adadmin"
  ou_path              = "OU=myou,DC=occdev,DC=local"
  domain_user_password = var.adjoinerpassword 
  registration_token   = module.hostpool_reg.registration_info
  host_pool_id         = module.hostpool.id

  tags = {
      Client="OCC"
   }
}


```
## Requirement 

Name | Version
-----|--------
terraform | >= 0.13
azurerm | >= 2.40.0

## Providers

| Name | Version |
|------|---------|
azurerm | >= 2.40.0

## Maintainers
OCC Engineering Team


## Contribute
Small note: If editing the Readme, please conform to the [standard-readme](https://github.com/optum-connect/Standard-readme-protocol-OCC) specifications.

