resource "aws_instance" "jenkins" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  root_block_device {
    volume_type = "gp3"
    volume_size = 80
  }
  user_data = file("jenkins.sh")
  tags = {
    Name = "jenkins"
    terraform = "true"
  }
}

resource "aws_route53_record" "jenkins" {
  zone_id = var.zone_id
  name    = "jenkins.${var.domain_name}"
  type    = "A"
  ttl     = 2
  records = [aws_instance.jenkins.public_ip]
  allow_overwrite = true
}