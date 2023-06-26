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


data "google_compute_network" "my-network" {
  name = "vpc-network-custom"
}



resource "google_compute_instance" "vm_instance" {

  name                      = "terraform-instance"
  machine_type              = "f1-micro"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = data.google_compute_network.my-network.self_link
    subnetwork = data.google_compute_network.my-network.subnetworks_self_links[1]
    access_config {
    }
  }

}


 