# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

# Direct SSH Access for Lizzo lovers
# For main VPC
resource "google_compute_firewall" "ssh" {
  name    = "allow-lizzo-ssh"
  network = google_compute_network.main.name
  #direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}




resource "google_compute_firewall" "web-traffic" {
  name    = "allow-web-traffic"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}


# Lizzo's favorite proxy FW rule
resource "google_compute_firewall" "proxy" {
  name        = "allow-lizzo-proxy"
  network     = google_compute_network.main.name
  description = "HTTP traffic for NGINX reverse proxy"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}


# Lizzo's ping FW rule
resource "google_compute_firewall" "ping" {
  name    = "allow-ping"
  network = google_compute_network.main.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}