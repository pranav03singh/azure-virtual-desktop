variable "location" {
  description = "location in which to deploy these resources"
}

variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources"
}

variable "rdsh_count" {
  description = "**OPTIONAL**: Number of WVD machines to deploy"
  default     = 1
}


variable "vm_prefix" {
  description = "Prefix of the name of the WVD machine(s)"
  default     = "vm"
}

variable "subnet_id" {
  description = "ID of the Subnet in which the machines will exist"
}

variable "vm_size" {
  description = "**OPTIONAL**: Size of the machine to deploy"
  default     = "Standard_F2s"
}
##################################  Image details #############################
variable "image_id"{
description = "ID of the VM image"
default     = null
}

variable "vm_publisher" {
  description = "**OPTIONAL**: Publisher of the vm image"
  default     = null
}

variable "vm_offer" {
  description = "**OPTIONAL**: Offer of the vm image"
  default     = null
}

variable "vm_sku" {
  description = "**OPTIONAL**: Sku of the vm image"
  default     = null
}

variable "vm_version" {
  description = "**OPTIONAL**: Version of the vm image"
  default     = null
}

################################## ############# #############################

variable "vm_storage_os_disk_size" {
  description = "**OPTIONAL**: The size of the OS disk"
  default     = "128"
}

variable "local_admin_username" {
  description = "**OPTIONAL**: Name of the local admin account"
  default     = "rdshadm"
}


variable "admin_password" {
  description = "The password of the VM admin"
  default     = "AzureVDadmin@12345"
}


variable "vm_timezone" {
  description = "The vm_timezone of the vms"
  default     = "Eastern Standard Time"
}


variable "secure_boot_enabled" {
  description = "Whether to enable automatic updates"
  default     = true
}

variable "enable_automatic_updates" {
  description = "Whether to enable automatic updates"
  default     = false
}

variable "encryption_at_host_enabled" {
  description = "Whether to enable automatic updates"
  default     = true
}

variable "patch_mode" {
  description = "Whether to patch manually or using AutomaticByOS or using AutomaticByPlatform"
  default     = "Manual"
}

variable "vtpm_enabled" {
  description = "Specifies if vTPM (virtual Trusted Platform Module) and Trusted Launch is enabled for the Virtual Machine."
  default     = true
}

#############################  VM Ends ###########################################



variable "domain_name" {
  description = "Name of the domain to join"
}

variable "domain_user_upn" {
  description = "UPN of the user to join VM  with the domain"
}


variable "domain_user_password" {
  description = "Password of the user to authenticate with the domain"
  sensitive   = true
}

variable "ou_path" {
  description = "OU path to us during domain join"
  default     = null
}


variable "wvd_script_url" {
  description = " The URL in which the script to join to host pool exist"
  default     = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration.zip"
}

variable "host_pool_id" {
  description = "Id of the host pool"
  default     = null
}

variable "registration_token" {
  description = "Id of the host pool"
  default     = null
}

###################


variable "tags" {
  default = null
}