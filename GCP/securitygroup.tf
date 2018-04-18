
/* INGRESS */
resource "google_compute_firewall" "nat" {
  name    = "${var.environment_name}-nat-ingress"
  network = "${google_compute_network.main.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "443" , "80"]
  }

  source_ranges = ["${var.MY_IP}"]
  target_tags   = ["cb_allow-ssh-https"]
}

/* INGRESS ONLY FOR TFE */
resource "google_compute_firewall" "nat-tfe" {
  name    = "${var.environment_name}-nat-tfe"
  network = "${google_compute_network.main.name}"

  
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${var.TFE_IP}"]
  target_tags   = ["cb_tfe_allow-ssh"]
}

# EGRESS #
resource "google_compute_firewall" "nat-egress" {
  name    = "${var.environment_name}-nat-egress"
  network = "${google_compute_network.main.name}"

  
  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["1-65535"]
  }
  direction = "EGRESS"
  destination_ranges = ["${var.vpc_cidr}"]
  target_tags   = ["cb-allow-egress"]
}