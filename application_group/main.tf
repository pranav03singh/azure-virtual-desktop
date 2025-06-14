## Code description : Terraform template module to create a Azure Virtual Desktop Application Group.
## Author : Pranav Singh
## Created Date : 7th December 2022
## Version : 1.1
## Last Modified Date : 31st July 2023
## Last Modified By : -- Pranav Singh
## For any information please reach out to "OCC_Engineering@ds.uhc.com"


resource "azurerm_virtual_desktop_application_group" "this" {
  name                = var.wvd_desktop_App_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.type
  host_pool_id        = var.host_pool_id

  #optional
  default_desktop_display_name = var.default_desktop_display_name
  friendly_name                = var.friendly_name
  description                  = var.description
  tags                         = var.tags
}
