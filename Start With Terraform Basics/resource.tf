resource "aws_instance" "my_EC2" {
  ami = "ami-0688ba7eeeeefe3cd"
  instance_type = "t2.micro"

  tags = {
    name = "my first EC2 from Terraform"
  }
}