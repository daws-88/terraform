data "aws_ami" "sonarqube" {
  owners = [679593333241]
  most_recent = true

  filter {
    name   = "name"
    values = ["SolveDevOps-SonarQube-Server-Ubuntu24.04-20260612-938693e4-e3336ad7-93a2-4e7c-8ed8-227cfbf25da4"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
    
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]   # or "arm64" ami-0f31bd7e406ed0351
  }
}