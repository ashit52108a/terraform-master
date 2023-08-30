variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAYDCWZIA63MTH2JRL"
}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
default = "us-east-1"
}

variable "Security_Group"{
    type = list
    default = ["sg-tf-24076", "sg-tf-90890", "sg-tf-456789"]
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0b0ea68c435eb488d"
        us-east-2 = "ami-05803413c51f242b7	"
        us-west-2 = "ami-0688ba7eeeeefe3cd"
        us-west-1 = "ami-0454207e5367abf01"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}