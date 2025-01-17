locals {
 target_node = "pve"
 cidr = "192.168.0.0/24"
 onboot = true
 agent = 1
 cloud_init_template = "ubuntu-2204-cloud-init"
 os_type = "cloud-init"
 ciuser = "tux"

 bridge = {
  interface = "vmbr0"
  model     = "virtio"
 }

 disks = {
  main = {
   backup  = true
   format  = "raw"
   type    = "disk"
   storage = "local-lvm"
   slot    = "scsi0"
   discard = true
  }
  cloudinit = {
   backup  = true
   format  = "raw"
   type    = "cloudinit"
   storage = "local-lvm"
   slot    = "ide2"
  }
}

 cloud_init = {
  user = "tux"
  password = "tux"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
 }

 master = {
  count = 1
  name = "master"
  vmid  = 500
  cores = 2
  sockets = 1
  type_cpu = "host"
  memory = 4096
 }
}