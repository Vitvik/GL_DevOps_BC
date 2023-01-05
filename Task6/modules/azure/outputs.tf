output "public_ip_azure" {
  value = azurerm_public_ip.public_ip.ip_address
}