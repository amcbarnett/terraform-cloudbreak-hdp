resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "${var.AWS_INSTANCE_NAME}"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.cloudbreak-allow-sg.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
}

output "ip" {
 value = "${aws_instance.example.public_ip}"
}
