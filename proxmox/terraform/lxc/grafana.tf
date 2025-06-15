resource "proxmox_lxc" "grafana" {
  count         = local.grafana.count
  vmid          = local.grafana.vmid + count.index
  hostname      = format("%s-%d", local.grafana.name, count.index)
  target_node   = local.proxmox_node
  ostemplate    = local.lxc_template
  cores         = local.grafana.cores
  memory        = local.grafana.memory
  start         = local.start
  unprivileged  = true

  rootfs {
    storage = local.grafana.storage
    size    = local.grafana.disk_size
  }

  network {
    name    = local.eth_name
    bridge  = local.bridge_name
    ip      = format("%s/24", cidrhost(local.cidr, local.grafana.last_octect + count.index))
    gw      = local.gateway_ip
  }

  ssh_public_keys = local.ssh_public_key
  password        = local.default_password
}
