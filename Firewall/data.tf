data "google_compute_network" "my-network" {
  name = "vpc-network-custom"
}

output "op" {
  value = data.google_compute_network.my-network.id


}

output "op1" {
  value = data.google_compute_network.my-network.subnetworks_self_links


}