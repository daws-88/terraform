resource "aws_instance" "terraform" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  root_block_device {
    volume_type = "gp3"
    volume_size = 50 
  }
  user_data = file("docker.sh")
  tags = {
    Name = "Workstation"
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