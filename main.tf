terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "2.7.0"
        }
    }
}

resource "digitalocean_droplet" "terraform-training" {
    image = "ubuntu-20-04-x64"
    name = "terraform-training"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_ssh_key" "default" {
    name = "terraform-training"
    public_key = file(".ssh/id_rsa.pub")
}

provider "digitalocean" {
    token = var.do_token
}