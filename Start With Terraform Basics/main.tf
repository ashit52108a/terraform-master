
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
    version = "5.13.1"
    access_key = "AKIAYDCWZIA6TAUDNA6Z"
    secret_key = "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"
    region     = "us-west-2"
}


resource "aws_instance" "MyFirstInstnace" {
  count         = 3
  ami           = "ami-0688ba7eeeeefe3cd"
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstnce-${count.index}"
  }
}