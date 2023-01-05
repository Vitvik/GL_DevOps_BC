variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "access_ip" {
  type = string
}
variable "region_aws" {
  description = "Value of the region aws for the instance"
  type        = string
  default     = "eu-west-1"
}
variable "ami" {
  description = "Value of the ami image"
  type        = string
  default = "ami-03c5ca432499db74d"
  #default     = "ami-05e786af422f8082a"
}
variable "tags" {
  type = map(string)
  default = {
    Name = "gl-bc-t6-aws"
    "Terraform" = "TRUE",
    "Owner"     = "Vitvik"
  }
}
variable "insScript" {
  description = "Install script"
  default     = "insScript.sh"
}
variable "key_name" {
  description = "Key name"
  default     = "id_rsa"
}
variable "public_key" {
  description = "Public key"
  default     = "id_rsa.pub"
}