## Code description : Terraform template module to add an Azure Virtual Desktop VM 
## Author : Pranav Singh
## Created Date : 7th Dec 2022
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


resource "azurerm_virtual_machine" "wvdvm" {
  count                 = var.rdsh_count
  name                  = "${var.vm_prefix}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = ["${azurerm_network_interface.rdsh.*.id[count.index]}"]
  vm_size               = var.vm_size
  availability_set_id   = azurerm_availability_set.wvd_av_set.id

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
  # Either provide id or the other details like id, publisher, offer, sku, version
    id        = var.image_id  
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  storage_os_disk {
    name              = "${lower(var.vm_prefix)}-${count.index + 1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = var.vm_storage_os_disk_size
  }

  os_profile {
    computer_name  = "${var.vm_prefix}-${count.index + 1}"
    admin_username = var.local_admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
    timezone                  = var.vm_timezone
  }

}
