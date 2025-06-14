
variable "wvd_workspace_name" {
  type        = string
  description = "(Required) The name of the Virtual Desktop Workspace."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "(Required) The location/region where the Virtual Desktop Workspace is located. "
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Virtual Desktop Workspace. "
}

variable "friendly_name" {
  type        = string
  default     = "VD Workspace"
  description = "(Optional) A friendly name for the Virtual Desktop Workspace."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) A description for the Virtual Desktop Workspace."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = " (Optional) A mapping of tags to assign to the resource."
}






