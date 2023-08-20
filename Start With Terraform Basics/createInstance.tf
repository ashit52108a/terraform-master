resource "aws_instance" "MyFirstInstnace" {
  count         = 3
  ami           = "ami-0688ba7eeeeefe3cd"
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstnce-${count.index}"
  }
}