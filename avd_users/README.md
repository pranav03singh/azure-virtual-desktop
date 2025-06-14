## Table of Contents

- [Purpose](#purpose)
- [Usage](#usage)
- [Requirement](#requirement)
- [Association](#association)
- [Maintainers](#maintainers)
- [Contribute](#contribute)

## Purpose 
Terraform template module to add an Azure Virtual Desktop Users .


## usage
Azuread_user resoucre each with different name , user principle name create mutliple instances 
based on the set of user names passed to var.avd_users input var . 

```
resource "azurerm_role_assignment" "desktop-virtualisation-user" {
  for_each             = data.azuread_user.user
  scope                =  var.appgroup_id
  role_definition_name = "Desktop Virtualization User"
  principal_id         = data.azuread_user.user[each.key].id
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

