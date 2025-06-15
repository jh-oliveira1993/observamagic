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
    count        = 1
    name         = "database"
    vmid         = 500
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "20G"
    last_octect  = 50
  }
  server = {
    count        = 1
    name         = "server"
    vmid         = 600
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 60
  }
  frontend = {
    count        = 1
    name         = "frontend"
    vmid         = 700
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 70
  }
  proxy = {
    count        = 1
    name         = "proxy"
    vmid         = 800
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 80
  }
  grafana = {
    count        = 1
    name         = "grafana"
    vmid         = 900
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 90
  }
}


