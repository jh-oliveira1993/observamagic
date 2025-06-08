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
      ssh_key_path = pathexpand("~/.ssh/id_rsa")
    }
  )
  filename        = "inventory.ini"
  file_permission = "0600"
}
