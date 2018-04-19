
#gcloud compute images create cloudbreak-deployer-250-2018-04-03 
#--source-uri gs://sequenceiqimage/cloudbreak-deployer-250-2018-04-03.tar.gz
resource "google_compute_image" "cloudbreak-deployer" {
  name = "cloudbreak-deployer-250-2018-04-03"
  project = "${var.gcp_project}"

  timeouts {
    create = "60m"
    delete = "2h"
  }
 
  raw_disk {
    source ="https://storage.googleapis.com/sequenceiqimage/cloudbreak-deployer-250-2018-04-03.tar.gz"
  }
}

data "google_compute_zones" "main" {}

resource "google_compute_instance" "demo" {
  name         = "${var.INSTANCE_USERNAME}"
  machine_type = "${var.INSTANCE_NAME}"
  #zone         = "${element(data.google_compute_zones.main.names,count.index)}"
  zone         = "${element(data.google_compute_zones.main.names,1)}"
  tags = ["version", "2.5"]

  boot_disk {
    initialize_params {
      image = "${google_compute_image.cloudbreak-deployer.self_link}"
    }
  }

  network_interface {
    network = "${google_compute_network.main.self_link}"

    access_config {
      // Ephemeral IP
    }
  }

   service_account {
    email = "{google_service_account.cloudbreak-gcp-service.email}" 
   # scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   scopes = ["default"]
  }

}

/*

resource "google_compute_backend_service" "MyResource" {
   name = "example-name"
   description = "example-description"
   health_checks  = ["example-health_checks"]
}
*/
output "external_ip"{
  value = "${google_compute_instance.demo.network_interface.0.access_config.0.assigned_nat_ip}"
}