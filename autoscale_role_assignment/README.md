## Table of Contents

- [Purpose](#purpose)
- [Usage](#usage)
- [Requirement](#requirement)
- [Association](#association)
- [Maintainers](#maintainers)
- [Contribute](#contribute)

## Purpose 
Terraform template module to add an Azure Virtual Desktop Autoscale Role Assignment .


## usage
Assignmnet of autoscale role over the resource group to Windows Virtual Desktop SPN. 

```

module "autoscale_role_assignment"{
  source = "tfe.optum.com/OCC/IaC-Modules/azurerm//azure-virtual-desktop/autoscale_role_assignment/"

  rg_id = module.avd_rg.rg_id
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

