resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  tags = var.ec2_tags
}

resource "aws_security_group" "allow-1" {
  name = var.sg_name

  tags = {
    Name = "allow-1"
  }
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
}
