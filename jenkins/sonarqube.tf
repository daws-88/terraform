resource "aws_instance" "sonar" {
   count = var.sonar ? 1 : 0
  ami = data.aws_ami.sonarqube.id
  instance_type = "t3.large"
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  key_name = "daws-86s"
  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }
  tags = {
    Name = "SonarQube"
    Jenkins = "true"
  }
}

resource "aws_route53_record" "sonar" {
  count = var.sonar ? 1 : 0
  zone_id = var.zone_id
  name    = "sonar.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.sonar[0].public_ip]
  allow_overwrite = true
}