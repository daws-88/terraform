resource "aws_instance" "terraform" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-03e874f9d28347e48"]
  tags = {
    Name      = "terraform"
    terraform = "true"
  }
}
