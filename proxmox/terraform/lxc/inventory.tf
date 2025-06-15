resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
      database = [
        for i in range(local.database.count) : {
          ip_address = split("/", proxmox_lxc.database[i].network[0].ip)[0]
          user       = local.inv_user
          vm_name    = proxmox_lxc.database[i].hostname
        }
      ]
      server = [
        for i in range(local.server.count) : {
          ip_address = split("/", proxmox_lxc.server[i].network[0].ip)[0]
          user       = local.inv_user
          vm_name    = proxmox_lxc.server[i].hostname
        }
      ]
      frontend = [
        for i in range(local.frontend.count) : {
          ip_address = split("/", proxmox_lxc.frontend[i].network[0].ip)[0]
          user       = local.inv_user
          vm_name    = proxmox_lxc.frontend[i].hostname
        }
      ]
      proxy = [
        for i in range(local.proxy.count) : {
          ip_address = split("/", proxmox_lxc.proxy[i].network[0].ip)[0]
          user       = local.inv_user
          vm_name    = proxmox_lxc.proxy[i].hostname
        }
      ] 
      grafana = [
        for i in range(local.grafana.count) : {
          ip_address = split("/", proxmox_lxc.grafana[i].network[0].ip)[0]
          user       = local.inv_user
          vm_name    = proxmox_lxc.grafana[i].hostname
        }
      ]               
      ssh_key_path = pathexpand("~/.ssh/id_rsa")
    }
  )
  filename        = "inventory.ini"
  file_permission = "0600"
}
