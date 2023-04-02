resource "google_compute_instance" "dareit-vm-ci" {
  name         = "dareit-vm-tf-ci"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "static" {
  name          = "${random_id.bucket_prefix.hex}-new-bucket"
  location      = "US"
  storage_class = "COLDLINE"

  uniform_bucket_level_access = true
}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}