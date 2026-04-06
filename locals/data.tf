data "aws_ami" "joindevops" {
  owners = [973714476881]
  most_recent = true

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]   # or "arm64"
  }
  
}
output "ami_id" {
    value = data.aws_ami.joindevops.id
}
