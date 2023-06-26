resource "google_compute_instance" "vm_instance1" {
  name         = "terraform-instance1"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc_network.self_link}" 
    subnetwork = data.google_compute_network.my-network.subnetworks_self_links[0]
    access_config {
    }
  }


}

