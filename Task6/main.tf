module "aws" {
  source = "./modules/aws"
  aws_secret_key = ""
  aws_access_key = ""
  access_ip      = ""
}

module "azure" {
  source = "./modules/azure"
  azure_subscription_id = ""
  azure_tenant_id       = ""
  azure_client_id       = ""
  azure_client_secret   = ""
}