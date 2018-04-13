#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}

variable "SSH_KEY_NAME" {
  default = "cloudbreakkeypair"
  description = "Pre-existing AWS key name you will use to access the instance(s)"
}

variable "MY_IP" {
  default = "0.0.0.0/0"
}

variable "INSTANCE_NAME" {
  default = "t2.micro"
}

variable "INSTANCE_USERNAME" {
  default = "cloudbreak"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "cloudbreakkeypair.pem"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "cloudbreakkeypair.pub"
}

variable "PRIVATE_KEY" {
  default = ""
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-8d8220f0"
    us-west-1 = "ami-de5949be"
    us-west-2 = "ami-59432721"
    eu-west-1 = "ami-0b70cb1044802db4a"
    eu-central-1 = "ami-2d7827c6"
    ap-northeast-1 = "ami-e9564195"
    ap-southeast-1 = "ami-8e98c2f2"
    ap-southeast-2 = "ami-31985653"
    sa-east-1 = "ami-955402f9"
  }
}

variable "UAA_DEFAULT_SECRET" {
  description = "Secret Used for Cloudbread Deployer"
}

variable "UAA_DEFAULT_USER_PW" {
  description = "Default User password for Cloudbread Deployer to log into UI"
}

variable "UAA_DEFAULT_USER_EMAIL" {
  description = "Default User Email for Cloudbread Deployer to log into UI"
}
