output "AWS_public_ip" {
  value = module.aws.pub_ip_aws
}
output "Azure_public_ip" {
  value = module.azure.public_ip_azure
}