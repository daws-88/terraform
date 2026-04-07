resource "aws_instance" "terraform" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  tags = {
    Name = "terraform"
    terraform = "true"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue
}
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy'"
  }
  
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
    }
  
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx",
      "echo nginx is stopped"
    ]
    when = destroy
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
