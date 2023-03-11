resource "digitalocean_droplet" "test-droplet" {
  name     = "example-01"
  size     = var.droplet-size
  image    = var.droplet-image
  region   = var.region
  vpc_uuid = digitalocean_vpc.main-vpc.id
}