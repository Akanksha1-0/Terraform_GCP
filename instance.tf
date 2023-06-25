resource "google_compute_instance" "vm_instance1" {
  name         = "terraform-instance1"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "vpc-network"

    access_config {
      // Ephemeral public IP
    }
  }

}

resource "google_compute_network" "vpc_network" {
  project                                   = "arched-elixir-390809"
  name                                      = "vpc-network"
  auto_create_subnetworks                   = true
  
}
