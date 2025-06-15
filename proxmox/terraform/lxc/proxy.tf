resource "proxmox_lxc" "proxy" {
  count         = local.proxy.count
  vmid          = local.proxy.vmid + count.index
  hostname      = format("%s-%d", local.proxy.name, count.index)
  target_node   = local.proxmox_node
  ostemplate    = local.lxc_template
  cores         = local.proxy.cores
  memory        = local.proxy.memory
  start         = local.start
  unprivileged  = true

  rootfs {
    storage = local.proxy.storage
    size    = local.proxy.disk_size
  }

  network {
    name    = local.eth_name
    bridge  = local.bridge_name
    ip      = format("%s/24", cidrhost(local.cidr, local.proxy.last_octect + count.index))
    gw      = local.gateway_ip
  }

  ssh_public_keys = local.ssh_public_key
  password        = local.default_password
}
