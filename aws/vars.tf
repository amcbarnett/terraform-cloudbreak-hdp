#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}

variable "INSTANCE_NAME" {
  default = "t2.micro"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "cloudbreakkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "cloudbreakkey.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-8d8220f0"
    Us-west-1 = "ami-de5949be"
    us-west-2 = "ami-59432721"
    eu-west-1 = "ami-0b70cb1044802db4a"
    eu-central-1 = "ami-2d7827c6"
    ap-northeast-1 = "ami-e9564195"
    ap-southeast-1 = "ami-8e98c2f2"
    ap-southeast-2 = "ami-31985653"
    sa-east-1 = "ami-955402f9"
  }
}
