resource "aws_instance" "terraform" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.lifecycle.id]
  tags = {
    Name = "terraform"
    terraform = "true"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_security_group" "lifecycle" {
  name = "lifecycle"

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
  lifecycle {
    create_before_destroy = true
  }
}

## ignore_changes
# lifecycle {
#     ignore_changes = [
#       desired_capacity,
#       min_size,
#       max_size,
#     ]
# }