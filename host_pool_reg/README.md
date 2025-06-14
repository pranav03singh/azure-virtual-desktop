## Table of Contents

- [Purpose](#purpose)
- [Usage](#usage)
- [Requirement](#requirement)
- [Association](#association)
- [Maintainers](#maintainers)
- [Contribute](#contribute)

## Purpose 
Terraform template module to add an Azure Virtual Desktop Host Pool Registration of VMs

## Usage
```
Validate all the required variables in variable.tf file,need to get the info of the below variables .
Input Variables 

- hostpool_id
- expiration_date

Output variables 

registration_info        = azurerm_virtual_desktop_host_pool_registration_info.hostpool_reg.token 

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

