provider "google" {
  #credentials = "${var.gcp_credentials}"
  credentials = "${base64decode(google_service_account_key.acceptance.private_key)}"
  project     = "${var.gcp_project}"
  region      = "${var.gcp_region}"
}
