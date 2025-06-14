## Code description : Terraform template module to add a Published App in Azure Virtual Desktop
## Author : Pranav Singh
## Created Date : 31st Mar 2023 
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

resource "azurerm_virtual_desktop_application" "app" {
  name                         = var.app_name
  application_group_id         = var.application_group_id
  friendly_name                = var.friendly_name
  description                  = var.description
  path                         = var.path
  command_line_argument_policy = var.command_line_argument_policy
  command_line_arguments       = var.command_line_arguments
  show_in_portal               = var.show_in_portal
  icon_path                    = var.icon_path
  icon_index                   = var.icon_index
}