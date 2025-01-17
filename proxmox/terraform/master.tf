resource "proxmox_vm_qemu" "master" {
    count = local.master.count
    name = local.master.name + count.index    
    vmid  = local.master.vmid + count.index
    target_node = local.target_node

    clone = local.cloud_init_template
    cores = local.master.cores
    sockets = local.master.sockets
    cpu = local.master.type_cpu
    memory = local.master.memory

    network {
        bridge = local.bridge.interface
        model  = local.bridge.model
    }

    disk {
        type    = local.disks.main.type
        storage = local.disks.main.storage
        size    = local.master.disk_size
    }

    os_type = local.os_type
    ipconfig0 = format(
        "ip=%s/24,gw=%s",
        cidrhost(
        local.cidr,
        local.master.network_last_octect + count.index
        ),
        cidrhost(local.cidr, 1)
    )
    ciuser = local.cloud_init.user
    sshkeys = local.sshkeys
}