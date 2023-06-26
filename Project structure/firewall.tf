
resource "google_compute_firewall" "rules" {
  name    = "test-firewall"
  network = "${google_compute_network.vpc_network.id}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}