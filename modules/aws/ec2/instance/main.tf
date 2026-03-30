resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id != "" ? var.subnet_id : null
  vpc_security_group_ids      = length(var.vpc_security_group_ids) > 0 ? var.vpc_security_group_ids : null
  key_name                    = var.key_name != "" ? var.key_name : null

  tags = merge({
    Name = "ec2-instance"
  }, var.tags)
}
