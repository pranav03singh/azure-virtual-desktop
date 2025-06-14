## Code description : Terraform template module to add a Secure Azure Virtual Desktop VM 
## Author : Pranav Singh
## Created Date : 19th Mar 2024
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"

resource "azurerm_network_security_group" "wvdnsg" {
  name                = "${var.vm_prefix}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

}
resource "azurerm_availability_set" "wvd_av_set" {
  name                = "${var.vm_prefix}-aset"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "rdsh" {
  count               = var.rdsh_count
  name                = "${var.vm_prefix}-${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_prefix}-${count.index + 1}-nic-01"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

}


resource "azurerm_network_interface_security_group_association" "example" {
  count                     = var.rdsh_count
  network_interface_id      = azurerm_network_interface.rdsh[count.index].id
  network_security_group_id = azurerm_network_security_group.wvdnsg.id
}


resource "azurerm_windows_virtual_machine" "wvdvm" {
  count                 = var.rdsh_count
  name                  = "${var.vm_prefix}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = ["${azurerm_network_interface.rdsh.*.id[count.index]}"]
  size                  = var.vm_size
  admin_username        = var.local_admin_username
  admin_password        = var.admin_password
  availability_set_id   = azurerm_availability_set.wvd_av_set.id
  secure_boot_enabled   = var.secure_boot_enabled
  vtpm_enabled          = var.vtpm_enabled
  source_image_id       = var.image_id 

 # source_image_reference {
  # Either provide image_id or the other details like id, publisher, offer, sku, version
  #  publisher = var.vm_publisher
  #  offer     = var.vm_offer
  #  sku       = var.vm_sku
  #  version   = var.vm_version
 # }

  os_disk {
    name                 = "${lower(var.vm_prefix)}-${count.index + 1}"
    caching              = "ReadWrite"
    # create_option      = "FromImage"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.vm_storage_os_disk_size
  }
  
  computer_name  = "${var.vm_prefix}-${count.index + 1}"

  encryption_at_host_enabled  = var.encryption_at_host_enabled
  provision_vm_agent          = true
  enable_automatic_updates    = var.enable_automatic_updates
  patch_mode                  = var.patch_mode
  timezone                    = var.vm_timezone

  tags = var.tags


}
