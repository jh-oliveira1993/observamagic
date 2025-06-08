resource "proxmox_lxc" "database" {
  count         = local.database.count
  vmid          = local.database.vmid + count.index
  hostname      = format("%s-%d", local.database.name, count.index)
  target_node   = local.proxmox_node
  ostemplate    = local.lxc_template
  cores         = local.database.cores
  memory        = local.database.memory
  start         = local.start
  unprivileged  = true

  rootfs {
    storage = local.database.storage
    size    = local.database.disk_size
  }

  network {
    name    = local.eth_name
    bridge  = local.bridge_name
    ip      = format("%s/24", cidrhost(local.cidr, local.database.last_octect + count.index))
    gw      = local.gateway_ip
  }

  ssh_public_keys = local.ssh_public_key
  password        = local.default_password
}
