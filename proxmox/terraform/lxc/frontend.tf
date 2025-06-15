resource "proxmox_lxc" "frontend" {
  count         = local.frontend.count
  vmid          = local.frontend.vmid + count.index
  hostname      = format("%s-%d", local.frontend.name, count.index)
  target_node   = local.proxmox_node
  ostemplate    = local.lxc_template
  cores         = local.frontend.cores
  memory        = local.frontend.memory
  start         = local.start
  unprivileged  = true

  rootfs {
    storage = local.frontend.storage
    size    = local.frontend.disk_size
  }

  network {
    name    = local.eth_name
    bridge  = local.bridge_name
    ip      = format("%s/24", cidrhost(local.cidr, local.frontend.last_octect + count.index))
    gw      = local.gateway_ip
  }

  ssh_public_keys = local.ssh_public_key
  password        = local.default_password
}
