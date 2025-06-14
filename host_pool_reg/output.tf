 output "registration_info" {
  value       = azurerm_virtual_desktop_host_pool_registration_info.hostpool_reg.token 
  sensitive   = true
  description = " Registration Info of the Virtual Desktop Host Pool."
 }