## Code description : Terraform template module to add an Azure Virtual Desktop Role Assignment for Autoscale 
## Author : Pranav Singh
## Created Date : 29th May 2023
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

resource "random_uuid" "uuid" {
}

# AVD Autoscale Role
resource "azurerm_role_definition" "avd_autoscale_role" {
  name        = "AVD-AutoScale-Role"
  scope       = var.rg_id
  description = "AVD AutoScale Role"
  permissions {
    actions = [
      # "Microsoft.Insights/eventtypes/values/read",
      "Microsoft.Compute/virtualMachines/deallocate/action",
      "Microsoft.Compute/virtualMachines/restart/action",
      "Microsoft.Compute/virtualMachines/powerOff/action",
      "Microsoft.Compute/virtualMachines/start/action",
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.DesktopVirtualization/hostpools/read",
      "Microsoft.DesktopVirtualization/hostpools/write",
      "Microsoft.DesktopVirtualization/hostpools/sessionhosts/read",
      "Microsoft.DesktopVirtualization/hostpools/sessionhosts/write",
      "Microsoft.DesktopVirtualization/hostpools/sessionhosts/usersessions/delete",
      "Microsoft.DesktopVirtualization/hostpools/sessionhosts/usersessions/read",
      "Microsoft.DesktopVirtualization/hostpools/sessionhosts/usersessions/sendMessage/action",
      "Microsoft.Compute/virtualMachines/instanceView/read",
      "Microsoft.Authorization/*/read",
      "Microsoft.Insights/alertRules/*",
      "Microsoft.Resources/deployments/*",
      "Microsoft.Resources/subscriptions/resourceGroups/read",



    ]
    not_actions = []
  }
  assignable_scopes = [
    var.rg_id,
  ]
}

# Windows Virtual Desktop SPN
data "azuread_service_principal" "vd_spn" {
  display_name = "Windows Virtual Desktop"
}


# Windows Virtual Desktop SPN Role Assignment
resource "azurerm_role_assignment" "vd_spn_role_assignment" {

  name                             = random_uuid.uuid.result
  scope                            = var.rg_id
  role_definition_id               = azurerm_role_definition.avd_autoscale_role.role_definition_resource_id
  principal_id                     = data.azuread_service_principal.vd_spn.id
  skip_service_principal_aad_check = true
}



