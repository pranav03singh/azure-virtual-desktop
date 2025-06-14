variable "wvd_desktop_App_name" {
  type        = string
  description = " (Required) The name of the Virtual Desktop Application Group."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "(Required) The location/region where the Virtual Desktop Application Group is located. "
}

variable "resource_group_name" {
  type        = string
  description = " (Required) The name of the resource group in which to create the Virtual Desktop Application Group."
}

variable "type" {
  type        = string
  description = "(Required) Type of Virtual Desktop Application Group. Valid options are RemoteApp or Desktop application groups."
}

variable "host_pool_id" {
  type        = string
  description = "(Required) Resource ID for a Virtual Desktop Host Pool to associate with the Virtual Desktop Application Group."
}

variable "default_desktop_display_name" {
  type        = string
  default     = null
  description = "(Optional) Option to set the display name for the default sessionDesktop desktop when type is set to Desktop."
}

variable "friendly_name" {
  type        = string
  default     = "AVD App Group"
  description = "(Optional) Option to set a friendly name for the Virtual Desktop Application Group."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Option to set a description for the Virtual Desktop Application Group."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = " (Optional) A mapping of tags to assign to the resource."
}

