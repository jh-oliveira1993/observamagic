resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
      server = [for s in proxmox_lxc.server : {
        ip_address = s.network[0].ip  # Pegando o primeiro IP configurado
        lxc_name   = s.hostname
      }]
      database = [for s in proxmox_lxc.database : {
        ip_address = s.network[0].ip  # Pegando o primeiro IP configurado
        lxc_name   = s.hostname
      }]
      web = [for s in proxmox_lxc.web : {
        ip_address = s.network[0].ip  # Pegando o primeiro IP configurado
        lxc_name   = s.hostname
      }]
      proxy = [for s in proxmox_lxc.proxy : {
        ip_address = s.network[0].ip  # Pegando o primeiro IP configurado
        lxc_name   = s.hostname
      }]
    }
  )
  filename        = "inventory.ini"
  file_permission = "0600"
}