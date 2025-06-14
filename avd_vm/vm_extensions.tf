## Code description : Terraform template module to add an Azure Virtual Desktop VM extensions for AD Join and Host Pool join
## Author : Pranav Singh
## Created Date : 7th Dec 2022
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

resource "azurerm_virtual_machine_extension" "join-domain" {
  count                      = var.rdsh_count
  name                       = "${var.vm_prefix}-${count.index + 1}-domainJoin"
  virtual_machine_id         = azurerm_virtual_machine.wvdvm.*.id[count.index]
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true
  depends_on                 = [azurerm_virtual_machine.wvdvm]



  settings = <<SETTINGS
    {
        "Name": "${var.domain_name}",
        "OUPath": "${var.ou_path != null ? var.ou_path : ""}",
        "User": "${var.domain_user_upn}@${var.domain_name}",
        "Restart": "true",
        "Options": "3"
    }
SETTINGS

  protected_settings = <<SETTINGS
    {
        "Password": "${var.domain_user_password}"
    }
SETTINGS
}




resource "azurerm_virtual_machine_extension" "join_host_pool_extensions" {
  count                      = var.rdsh_count
  name                       = "${var.vm_prefix}-${count.index + 1}-custom_script_extensions"
  virtual_machine_id         = azurerm_virtual_machine.wvdvm.*.id[count.index]
  publisher                  = "Microsoft.Powershell"
  type                       = "DSC"
  type_handler_version       = "2.80"
  auto_upgrade_minor_version = true
  depends_on                 = [azurerm_virtual_machine_extension.join-domain]


  settings = <<SETTINGS
       {
        "configuration" : {
            "url": "${var.wvd_script_url}",
            "script": "Configuration.ps1",
            "function": "AddSessionHost"
        },
        "configurationArguments": {
            "HostPoolName": "${var.host_pool_id}",
            "registrationInfoToken": "${var.registration_token}" 
            
        }
    }
    SETTINGS
}
