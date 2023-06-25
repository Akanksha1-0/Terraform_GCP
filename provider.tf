provider "google" {
  project     = "arched-elixir-390809"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("sa.json")


}