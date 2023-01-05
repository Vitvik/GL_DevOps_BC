variable "azure_subscription_id" {
  type = string
}
variable "azure_tenant_id" {
  type = string
}
variable "azure_client_id" {
  type = string
}
variable "azure_client_secret" {
  type = string
}
variable "resource_group_name" {
  default = "GL_BC_T6_RG"
}
variable "resource_group_location" {
  default = "West Europe"
}
variable "size" {
  default = "Standard_B1s"
}
variable "admin_username" {
  default = "azureuser"
}
variable "user_data" {
  type    = string
  default = "insScript.sh"
}
variable "image_publisher" {
  default = "Debian"
}
variable "image_offer" {
  default = "debian-11"
}
variable "image_sku" {
  default = "11"
}
variable "image_version" {
  default = "latest"
}
variable "public_key" {
  default = "id_rsa.pub"
}