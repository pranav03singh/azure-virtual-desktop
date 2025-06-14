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

- app_name
- application_group_id
- path
- command_line_argument_policy

Output variables 

id        = azurerm_virtual_desktop_application.app.id

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

