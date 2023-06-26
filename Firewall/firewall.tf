terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.70.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "arched-elixir-390809"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("sa.json")
}



resource "google_compute_firewall" "rules" {
  name    = "test-firewall"
  network = data.google_compute_network.my-network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}