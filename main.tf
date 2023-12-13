terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "mytf-state-file"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "ec2" {
  ami = "ami-0fa1ca9559f1892ec"
  instance_type = "t2.micro"

  tags = {
    Name = "test-instance"
  }
}