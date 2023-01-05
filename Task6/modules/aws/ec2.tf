resource "aws_instance" "gl-bc-t6-aws" {
  ami           = var.ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.grafana_security.id]
  tags          = var.tags
  user_data     = file(var.insScript)
  key_name      = var.key_name
}
