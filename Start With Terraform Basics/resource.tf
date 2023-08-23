resource "aws_instance" "my_EC2" {
  ami = lookup(var.ami_image,var.region)
  instance_type = "t2.micro"

  tags = {
    name = "my first EC2 from Terraform"
  }
}