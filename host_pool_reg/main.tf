## Code description : Terraform template module to add an Azure Virtual Desktop Host Pool Registration of VMs
## Author : Pranav Singh
## Created Date : 7th Dec 2022
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

resource "azurerm_virtual_desktop_host_pool_registration_info" "hostpool_reg" {
  hostpool_id     = var.hostpool_id
  expiration_date = var.expiration_date
}