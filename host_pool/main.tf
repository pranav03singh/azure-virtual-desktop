
## Code description : Terraform template module to create an Azure Virtual Desktop Host Pool .

## Author : Pranav Singh
## Created Date : 7th Dec 2022
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

resource "azurerm_virtual_desktop_host_pool" "this" {
  name                = var.wvd_host_pool_name
  location            = var.location
  resource_group_name = var.resource_group_name


  type                             = var.type
  personal_desktop_assignment_type = var.assignment_type
  validate_environment             = var.validate_environment
  start_vm_on_connect              = var.start_vm_on_connect
  custom_rdp_properties            = var.custom_rdp_properties
  maximum_sessions_allowed         = var.maximum_sessions_allowed
  load_balancer_type               = var.load_balancer_type
  friendly_name                    = var.friendly_name
  description                      = var.description

  tags = var.tags
}
