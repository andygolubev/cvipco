terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_project" "terraform" {
  name        = "terraform"
  description = "terraform scripts space"
  purpose     = "Just trying out DigitalOcean"
  environment = "Development"
  resources   = [digitalocean_droplet.test-droplet.urn]
}