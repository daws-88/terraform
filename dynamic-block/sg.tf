resource "aws_security_group" "roboshop_sg" {
  name = "roboshop-strict"
  tags = {
    Name = "roboshop-strict"
  }

# block 
   dynamic ingress {
    for_each = toset(var.ingress_ports)
    content {
    from_port =  ingress.value # here ingress is a special key word
    to_port =  ingress.value
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1" # from all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}