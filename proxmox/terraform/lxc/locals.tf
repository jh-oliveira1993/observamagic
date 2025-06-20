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
    vmid         = 2000
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "20G"
    last_octect  = 200
  }
  server = {
    count        = 1
    name         = "server"
    vmid         = 2100
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 210
  }
  frontend = {
    count        = 1
    name         = "frontend"
    vmid         = 2200
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 220
  }
  proxy = {
    count        = 1
    name         = "proxy"
    vmid         = 2300
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 230
  }
  grafana = {
    count        = 1
    name         = "grafana"
    vmid         = 2400
    cores        = 2
    memory       = 1024
    storage      = "local-lvm"
    disk_size    = "8G"
    last_octect  = 240
  }
}


