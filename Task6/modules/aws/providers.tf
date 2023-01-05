terraform {
  required_providers {
     aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
   /* azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.37.0"
    }
    */
  }
}

provider "aws" {
  region     = var.region_aws
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
/*
provider "azurerm" {
  features {}
  subscription_id = module.azure.azure_subscription_id
  tenant_id       = module.azure.azure_tenant_id
  client_id       = module.azure.azure_client_id
  client_secret   = module.azure.azure_client_secret
}
*/
