variable "hostpool_id" {
  type        = string
  description = "(Required) Id of the Virtual Desktop Host Pool."
}

variable "expiration_date" {
  type        = string
  default     = "eastus"
  description = "(Required) Expiration of the Virtual Desktop Host Pool registration"
}
