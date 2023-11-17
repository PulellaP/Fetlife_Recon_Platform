terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.6.0"
    }
  }
}

variable "sshkey" {
    description = "SSH Key"
    type = string
    sensitive = true
}

variable "Linode_Token" {
    description = "Linode Token"
    type = string
    sensitive = true
}

variable "root_pass" {
    description = "Root password"
    type = string
    sensitive = true
}

resource "linode_instance" "web" {
    label = "subfinders-${count.index}"
    image = "linode/ubuntu18.04"
    region = "us-east"
    type = "g6-nanode-1"
    authorized_keys = [var.sshkey]
    root_pass = var.root_pass
    group = "subfinders"
    tags = ["subfinders"]
    count = 2
}

resource "linode_instance" "web2" {
    label = "directoryfinders"
    image = "linode/ubuntu18.04"
    region = "us-east"
    type = "g6-nanode-1"
    authorized_keys = [var.sshkey]
    root_pass = var.root_pass
    group = "directoryfinders"
    tags = ["directoryfinders"]
}

resource "linode_instance" "web3" {
    label = "portscanners-${count.index}"
    image = "linode/ubuntu18.04"
    region = "us-east"
    type = "g6-nanode-1"
    authorized_keys = [var.sshkey]
    root_pass = var.root_pass
    group = "portscanners"
    tags = ["portscanners"]
    count = 3
}

provider "linode" {
  token = var.Linode_Token
}
