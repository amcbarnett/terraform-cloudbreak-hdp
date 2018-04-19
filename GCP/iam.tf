resource "google_service_account" "cloudbreak-gcp-service" {
  account_id   = "cloudbreak-gcp-service"
  display_name = "cloudbreak-gcp-service"
  project = "${var.gcp_project}"
}

resource "google_service_account_key" "acceptance" {
  service_account_id = "${google_service_account.cloudbreak-gcp-service.unique_id}"
  public_key_type = "TYPE_X509_PEM_FILE"
}


resource "google_project_iam_member" "cb-computeuser-iam" {
  project = "${var.gcp_project}"
  role    = "roles/compute.imageUser"
  member  = "serviceAccount:${google_service_account.cloudbreak-gcp-service.email}"
}

resource "google_project_iam_member" "cb-instanceadmin-iam" {
  project = "${var.gcp_project}"
  role    = "roles/compute.instanceAdmin.v1"
  member  = "serviceAccount:${google_service_account.cloudbreak-gcp-service.email}"
}

resource "google_project_iam_member" "cb-networkadmin-iam" {
  project = "${var.gcp_project}"
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${google_service_account.cloudbreak-gcp-service.email}"
}

resource "google_project_iam_member" "cb-securityadmin-iam" {
  project = "${var.gcp_project}"
  role    = "roles/compute.securityAdmin"
  member  = "serviceAccount:${google_service_account.cloudbreak-gcp-service.email}"
}

resource "google_project_iam_member" "cb-storageadmin-iam" {
  project = "${var.gcp_project}"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.cloudbreak-gcp-service.email}"
}

resource "google_project_iam_member" "cb-accountservice-iam" {
  project = "${var.gcp_project}"
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.cloudbreak-gcp-service.email}"
}

