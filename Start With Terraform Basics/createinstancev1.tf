resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-0688ba7eeeeefe3cd"
  instance_type = "t2.micro"
}
 