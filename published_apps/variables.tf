variable "app_name" {
  type        = string
  description = "(Required) The name of the Virtual Desktop Application. Changing the name forces a new resource to be created."
}

variable "application_group_id" {
  type        = string
  description = "(Required) Resource ID for a Virtual Desktop Application Group to associate with the Virtual Desktop Application. Changing this forces a new resource to be created."
}

variable "friendly_name" {
  type        = string
  default     = ""
  description = "(Optional) Option to set a friendly name for the Virtual Desktop Application."
}

variable "description" {
  type        = string
  default     = ""
  description = "(Optional) Option to set a description for the Virtual Desktop Application."
}

variable "path" {
  type        = string
  description = "(Required) The file path location of the app on the Virtual Desktop OS."
}

variable "command_line_argument_policy" {
  type        = string
  default     = "DoNotAllow"
  description = "(Required) Specifies whether this published application can be launched with command line arguments provided by the client, command line arguments specified at publish time, or no command line arguments at all. Possible values include: DoNotAllow, Allow, Require."
}

variable "command_line_arguments" {
  type        = string
  default     = ""
  description = "(Optional) Command Line Arguments for Virtual Desktop Application."
}

variable "show_in_portal" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether to show the RemoteApp program in the RD Web Access server."
}

variable "icon_path" {
  type        = string
  default     = ""
  description = "(Optional) Specifies the path for an icon which will be used for this Virtual Desktop Application."
}

variable "icon_index" {
  type        = number
  default     = 0
  description = "(Optional) The index of the icon you wish to use."
}
