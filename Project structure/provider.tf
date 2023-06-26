provider "google" {
  project     = "arched-elixir-390809"
  region      = "us-west1"
  zone        = "us-west1-b"
  credentials = file("sa.json")


}