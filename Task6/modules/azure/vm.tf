# Azure resource group
resource "azurerm_resource_group" "gl_bc_t6_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
# Azure virtual machine
resource "azurerm_linux_virtual_machine" "gl-bc-t6-vm" {
  name                = "gl-bc-t6-vm"
  resource_group_name = azurerm_resource_group.gl_bc_t6_rg.name
  location            = azurerm_resource_group.gl_bc_t6_rg.location
  size                = var.size
  admin_username      = var.admin_username
  user_data           = filebase64(var.user_data)
  network_interface_ids = [
    azurerm_network_interface.gl_bc_t6_ni.id,
  ]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.public_key)
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}

# --- Network ---
# Azure Network interface
resource "azurerm_network_interface" "gl_bc_t6_ni" {
  name                = "gl_bc_t6_ni"
  location            = azurerm_resource_group.gl_bc_t6_rg.location
  resource_group_name = azurerm_resource_group.gl_bc_t6_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.gl_bc_t6_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Azure Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = "Grafana_IP"
  location            = azurerm_resource_group.gl_bc_t6_rg.location
  resource_group_name = azurerm_resource_group.gl_bc_t6_rg.name
  allocation_method   = "Static"
}

# Azure Virtual Network
resource "azurerm_virtual_network" "gl_bc_t6_vn" {
  name                = "gl_bc_t6_vn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.gl_bc_t6_rg.location
  resource_group_name = azurerm_resource_group.gl_bc_t6_rg.name
}

# Azure Subnet
resource "azurerm_subnet" "gl_bc_t6_subnet" {
  name                 = "gl_bc_t6_subnet"
  resource_group_name  = azurerm_resource_group.gl_bc_t6_rg.name
  virtual_network_name = azurerm_virtual_network.gl_bc_t6_vn.name
  address_prefixes     = ["10.0.2.0/24"]
}