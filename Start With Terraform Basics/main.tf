
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_instance" "example_instance" {
  count         = var.instance_count
  ami           = "ami-0688ba7eeeeefe3cd"  # Replace with your desired AMI
  instance_type = "t2.micro"
  

  tags = {
    Name = "ExampleInstance-${count.index}"
  }
}




