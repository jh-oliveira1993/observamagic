locals {
  lxc_template     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  proxmox_node     = "pve"
  cidr             = "192.168.0.0/24"
  gateway_ip       = "192.168.0.1"
  eth_name         = "eth0"
  bridge_name      = "vmbr0"
  start            = true
  default_password = "123qwe."
  ssh_public_key   = file("~/.ssh/id_rsa.pub")
  ssh_private_key  = file("~/.ssh/id_rsa")
  inv_user         = "root"

  database = {
    count        = 3
    name         = "database"
    vmid         = 800
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "20G"
    last_octect  = 80
  }
  ha-node = {
    count        = 2
    name         = "ha-node"
    vmid         = 810
    cores        = 1
    memory       = 512
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 90
  }
    gf-node = {
    count        = 1
    name         = "gf-node"
    vmid         = 820
    cores        = 1
    memory       = 512
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 150
  }
}


