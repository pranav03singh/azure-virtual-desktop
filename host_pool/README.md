## Table of Contents

- [Purpose](#purpose)
- [Usage](#usage)
- [Requirement](#requirement)
- [Association](#association)
- [Maintainers](#maintainers)
- [Contribute](#contribute)

## Purpose 
Terraform template module to create an Azure Virtual Desktop Host Pool .

## usage
```
Validate all the required variables in variable.tf file,need to get the info of the below variables .

Input Variables 
- wvd_host_pool_name
- resource_group_name
- location 
- load_balancer_type
- assignment_type
- validate_environment
- start_vm_on_connect
- custom_rdp_properties
- maximum_sessions_allowed
- preferred_app_group_type

Output variables 
name        = azurerm_virtual_desktop_host_pool.this.name
id          = azurerm_virtual_desktop_host_pool.this.id

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

