output "pub_ip_aws" {
  value = aws_instance.gl-bc-t6-aws.public_ip
}