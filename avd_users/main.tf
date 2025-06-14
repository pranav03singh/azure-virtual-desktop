## Code description : Terraform template module to add an Azure Virtual Desktop Users
## Author : Pranav Singh
## Created Date : 7th Dec 2022
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

# Query the Principal ID for each user in support_users
data "azuread_user" "user" {
  for_each            = toset(var.avd_users)
  user_principal_name = format("%s", each.key)
}

# Assign user access to AVD
resource "azurerm_role_assignment" "desktop-virtualisation-user" {
  for_each             = data.azuread_user.user
  scope                =  var.appgroup_id
  role_definition_name = "Desktop Virtualization User"
  principal_id         = data.azuread_user.user[each.key].id
}


