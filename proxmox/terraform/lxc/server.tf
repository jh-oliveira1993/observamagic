resource "proxmox_lxc" "server" {
  count         = local.server.count
  vmid          = local.server.vmid + count.index
  hostname      = format("%s-%d", local.server.name, count.index)
  target_node   = local.proxmox_node
  ostemplate    = local.lxc_template
  cores         = local.server.cores
  memory        = local.server.memory
  start         = local.start
  unprivileged  = true

  rootfs {
    storage = local.server.storage
    size    = local.server.disk_size
  }

  network {
    name    = local.eth_name
    bridge  = local.bridge_name
    ip      = format("%s/24", cidrhost(local.cidr, local.server.last_octect + count.index))
    gw      = local.gateway_ip
  }

  ssh_public_keys = local.ssh_public_key
  password        = local.default_password
}
