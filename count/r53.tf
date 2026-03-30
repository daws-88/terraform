resource "aws_route53_record" "roboshop" {
  count = 4
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"        # mongodb.daws88s.fun
  type    = "A"
  ttl     = 2
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}