## Code description : Terraform template module to add an Azure Virtual Desktop Workspace Association
## Author : Pranav Singh
## Created Date : 7th Dec 2022
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"


resource "azurerm_virtual_desktop_workspace_application_group_association" "this" {
  workspace_id         = var.wvd_workspace_id
  application_group_id = var.wvd_application_group_id
    
}