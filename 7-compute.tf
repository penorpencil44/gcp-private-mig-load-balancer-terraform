
resource "google_compute_instance" "default" {

  name         = "us-public-1"
  machine_type = "e2-medium"
  #zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("./startup.sh")
}