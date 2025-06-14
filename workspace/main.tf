resource "azurerm_virtual_desktop_workspace" "this" {
  name                = var.wvd_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  # optional
  friendly_name = var.friendly_name
  description   = "A description of my workspace"
  tags          = var.tags
}

