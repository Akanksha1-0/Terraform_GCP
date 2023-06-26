resource "google_compute_instance" "vm_instance1" {
  name         = "terraform-instance1"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = data.google_compute_network.my-network.self_link
    subnetwork = data.google_compute_network.my-network.subnetworks_self_links[1]
    access_config {
    }
  }


}

resource "google_compute_network" "my_network" {
  project                 = "arched-elixir-390809"
  name                    = "vpc-network"
  auto_create_subnetworks = False

}

variable "subnet" {
  type = map(object({
    cidr_block = string
    region     = string
  }))
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  for_each      = var.subnet
  name          = each.key
  ip_cidr_range = each.value.cidr_block
  region        = each.value.region
  network       = google_compute_network.vpc_network.id
}
