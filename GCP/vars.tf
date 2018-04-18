variable "gcp_credentials" {
  description = "Google Credentials"
}

variable "gcp_project" {
  default = "mckingdom-gcp"
  description = "Google Credentials"
}

variable "gcp_region" {
  description = "See all regions https://cloud.google.com/compute/docs/regions-zones/"
}

variable "var.environment_name" {
  default = "cloudbreak-vpc"
}

variable "vpc_cidrs_public" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}

variable "vpc_cidrs_private" {
  default = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
  ]
}

variable "MY_IP" {
  description = "Enter your public IP"
}

variable "TFE_IP" {
  #default = "0.0.0.0/0"
  #TFE Saas IP Address
  default ="54.87.174.74/32"
}
/*
variable "SSH_KEY_NAME" {
  default = "cloudbreakkeypair"
  description = "Pre-existing AWS key name you will use to access the instance(s)"
}



variable "INSTANCE_NAME" {
  default = "t2.micro"
}

variable "INSTANCE_USERNAME" {
  default = "cloudbreak"
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
*/