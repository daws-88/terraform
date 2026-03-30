resource "aws_instance" "terraform" {
  for_each = var.instances
  ami = "ami-0220d79f3f480ecf5"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  tags = {
    Name = each.key
    terraform = "true"
  }
}

resource "aws_security_group" "allow-1" {
  name = "allow-1"

  tags = {
    Name = "allow-1"
  }
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1" # from all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
