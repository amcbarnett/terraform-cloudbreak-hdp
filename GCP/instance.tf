resource "google_service_account" "cloudbreak-gcp-service" {
  account_id   = "cloudbreak-gcp-service"
  display_name = "cloudbreak-gcp-service"
  project = "${var.gcp_project}"
}

resource "google_service_account_key" "acceptance" {
  service_account_id = "${google_service_account.cloudbreak-gcp-service.unique_id}"
  public_key_type = "TYPE_X509_PEM_FILE"
}


resource "google_service_account_iam_binding" "cb-computeuser-iam" {
  service_account_id = "${google_service_account.cloudbreak-gcp-service.email}"
  role        = "roles/compute.imageUser"

  members = [
    "user:ancil@hashicorp.com",
  ]
}

resource "google_service_account_iam_binding" "cb-instanceadmin-iam" {
  service_account_id = "${google_service_account.cloudbreak-gcp-service.email}"
  role        = "roles/compute.instanceAdmin.v1"

  members = [
    "user:ancil@hashicorp.com",
  ]
}




/*

resource "google_compute_instance" "demo" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}

module "network-gcp" {
  source           = "git::ssh://git@github.com/hashicorp-modules/network-gcp"
  environment_name = "${random_id.environment_name.hex}"
  os               = "${var.os}"
  os_version       = "${var.os_version}"
  ssh_key_data     = "${module.ssh-keypair-data.public_key_data}"
  ssh_user         = "${var.ssh_user}"
}

resource "google_compute_backend_service" "MyResource" {
   name = "example-name"
   description = "example-description"
   health_checks  = ["example-health_checks"]
}

output "external_ip"{
  value = "${google_compute_instance.demo.network_interface.0.access_config.0.assigned_nat_ip}"
}
*/