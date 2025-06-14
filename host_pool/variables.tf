variable "wvd_host_pool_name" {
  type        = string
  description = "(Required) The name of the Virtual Desktop Host Pool."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "(Required) The location/region where the Virtual Desktop Host Pool is located."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The type of the Virtual Desktop Host Pool. Valid options are Personal or Pooled."
}

variable "type" {
  type        = string
  default     = "Pooled"
  description = "(Required) The type of the Virtual Desktop Host Pool. Valid options are Personal or Pooled"
}

variable "load_balancer_type" {
  type        = string
  default     = null
  description = " (Required) Load Balancer Type"
}

variable "assignment_type" {
  type        = string
  default     = null
  description = "(Optional) Automatic assignment The service will select an available host and assign it to an user. Direct Assignment – Admin selects a specific host to assign to an user."
}

variable "validate_environment" {
  type        = bool
  default     = null
  description = "(Optional) Allows you to test service changes before they are deployed to production. Defaults to false."
}

variable "start_vm_on_connect" {
  type        = bool
  default     = null
  description = "(Optional) Enables or disables the Start VM on Connection Feature. Defaults to false"
}

variable "custom_rdp_properties" {
  type        = string
  default     = null
  description = " (Optional) A valid custom RDP properties string"
}

variable "maximum_sessions_allowed" {
  type        = number
  default     = null
  description = " (Optional) A valid integer value from 0 to 999999 for the maximum number of users that have concurrent sessions on a session host. "
}

variable "friendly_name" {
  type        = string
  default     = "AVD Pool"
  description = "(Optional) A friendly name for the Virtual Desktop Host Pool."
}

variable "preferred_app_group_type" {
  type        = string
  default     = null
  description = "(Optional) Option to specify the preferred Application Group type for the Virtual Desktop Host Pool. Valid options are None, Desktop or RailApplications."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) A description for the Virtual Desktop Host Pool."
}


variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags for pool type"
}

