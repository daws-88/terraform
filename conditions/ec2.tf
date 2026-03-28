resource "aws_instance" "terraform" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = var.env == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  tags = {
    Name = "terraform"
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
