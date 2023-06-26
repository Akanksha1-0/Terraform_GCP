subnet = {
  subnet1 = { cidr_block = "10.0.0.0/20", region = "us-central1" }
  subnet2 = { cidr_block = "10.2.0.0/20", region = "europe-west1" }
}

machine_type= "e2-micro"

image = "debian-cloud/debian-11"