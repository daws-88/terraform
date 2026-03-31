resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraform
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" # mongodb.daws88s.fun
  type    = "A"
  ttl     = 2
  records = [each.value.private_ip]
}