## Table of Contents

- [Purpose](#purpose)
- [Usage](#usage)
- [Requirement](#requirement)
- [Association](#association)
- [Maintainers](#maintainers)
- [Contribute](#contribute)

## Purpose 
 Terraform template module to create a Azure Virtual Desktop Application Group.


## usage

```
Input Variables 
  name                = var.wvd_desktop_App_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.type
  host_pool_id        = var.host_pool_id

Output Variables
  name                = azurerm_virtual_desktop_application_group.this.name
  id                  = azurerm_virtual_desktop_application_group.this.id

## Example Usage 

resource "azurerm_virtual_desktop_application_group" "this" {
  name                = var.wvd_desktop_App_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.type
  host_pool_id        = var.host_pool_id
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

