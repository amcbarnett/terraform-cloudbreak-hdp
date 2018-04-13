resource "aws_security_group" "cloudbreak-allow-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = "cloudbreak-allow-sg"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.MY_IP}"]
  } 

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["${var.MY_IP}"]
  } 

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["${var.MY_IP}"]
  } 
tags {
    Name = "cb_allow-ssh-https"
  }

}