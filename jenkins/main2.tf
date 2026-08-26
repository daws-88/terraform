resource "aws_instance" "jenkins-agent" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  root_block_device {
    volume_type = "gp3"
    volume_size = 80
  }
  user_data = file("jenkins.sh")
  tags = {
    Name = "jenkins-agent"
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

resource "aws_route53_record" "jenkins-agent" {
  zone_id = var.zone_id
  name    = "jenkins-agent.${var.domain_name}"
  type    = "A"
  ttl     = 2
  records = [aws_instance.jenkins-agent.private_ip]
  allow_overwrite = true
}