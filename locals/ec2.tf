resource "aws_instance" "terraform" {
  ami = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  tags = local.ec2_tags
}

resource "aws_security_group" "allow-1" {
  name = "${local.common_name}-allow-1" # with this name security group is created

  ingress {
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.protocol
    cidr_blocks = var.cidir
  }
  
  egress {
    from_port = var.egress_from_port
    to_port = var.egress_from_port
    protocol = var.protocol # from all protocols
    cidr_blocks = var.cidir
  }
  
  tags = merge(
     var.common_tags,
     {
      Name = "${local.common_name}-allow-1"
     }
  )
  }

