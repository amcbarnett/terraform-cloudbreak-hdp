# Internet VPC
/*resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "cloudbreak-vpc"
    }
}
*/
resource "google_compute_network" "main" {
  name                    = "${var.environment_name}"
  description = "VPC Network for Cloudbreak"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}

# Subnets
resource "google_compute_subnetwork" "public" {
  count = "${length(var.vpc_cidrs_public)}"

  name          = "${var.environment_name}-public-${count.index}"
  ip_cidr_range = "${element(var.vpc_cidrs_public,count.index)}"
  network       = "${google_compute_network.main.self_link}"
  region        = "${var.gcp_region}"
}

resource "google_compute_subnetwork" "private" {
  count = "${length(var.vpc_cidrs_private)}"

  name          = "${var.environment_name}-private-${count.index}"
  ip_cidr_range = "${element(var.vpc_cidrs_private,count.index)}"
  network       = "${google_compute_network.main.self_link}"
  region        = "${var.gcp_region}"
}

#
# Public
#
resource "google_compute_route" "public" {
  count = "${length(var.vpc_cidrs_public)}"

  name                   = "${var.environment_name}-public-${count.index}"
  dest_range             = "0.0.0.0/0"
  network                = "${google_compute_network.main.name}"
  next_hop_ip            = "${element(google_compute_subnetwork.public.*.gateway_address,count.index)}"
  priority               = 100

  tags = [
    "public-subnet",
    "zone-${element(google_compute_subnetwork.public.*.name,count.index)}",
  ]
}