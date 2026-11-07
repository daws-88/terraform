terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.38.0"
    }
  }
  backend "s3" {
    bucket         = "venkatsai-843976228791-us-east-1-an"
    key            = "demo.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile =   true
  }
}

provider "aws" {
  # Configuration options
}
