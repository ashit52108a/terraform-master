# Create the VPC
resource "aws_vpc" "dms_vpc" {
  cidr_block           = "10.0.1.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "DMSVPC"
  }
}

# Create two public and two private subnets across two AZs
resource "aws_subnet" "public_subnet" {
  count                  = 2
  vpc_id                 = aws_vpc.dms_vpc.id
  cidr_block             = "10.0.1.${4 + count.index}.0/24"
  availability_zone      = element(["us-west-2a", "us-west-2b"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count              = 2
  vpc_id             = aws_vpc.dms_vpc.id
  cidr_block         = "10.0.1.${8 + count.index}.0/24"
  availability_zone  = element(["us-west-2a", "us-west-2b"], count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

# Create a security group with inbound rules for MySQL/Aurora and PostgreSQL
resource "aws_security_group" "dmssg" {
  name        = "DMSSG"
  description = "DMS Security Group"

  ingress {
    from_port   = 3306 # MySQL/Aurora
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere
  }

  ingress {
    from_port   = 5432 # PostgreSQL
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere
  }

  vpc_id = aws_vpc.dms_vpc.id
}

# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.dms_vpc.id
}
