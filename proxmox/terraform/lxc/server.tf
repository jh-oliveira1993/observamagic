resource "proxmox_lxc" "server" {
  count         = local.server.count 
  hostname      = format(
                    "%s-%s",
                    local.server.name,
                    count.index
                )
  cores         = local.server.cores
  memory        = local.server.memory
  swap          = local.server.swap
  unprivileged  = local.unprivileged

  features {
  nesting = local.feature_nesting
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  network {
    name   = local.network_name
    bridge = local.network_bridge
    ip     = format(
                "%s/24",
                cidrhost(
                local.cidr,
                local.server.last_octect + count.index
                )
            )
    gw     = format(
                "%s",
                cidrhost(local.cidr, 1)
            )
    ip6    = local.ipv6
  }
  ostemplate   = local.ostemplate
  password     = local.password
  target_node  = local.target_node
  onboot       = local.onboot
  start        = local.start
  ssh_public_keys = local.ssh_public_keys
}