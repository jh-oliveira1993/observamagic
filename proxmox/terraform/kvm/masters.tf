resource "proxmox_vm_qemu" "masters" {
    count = local.masters.count
    nameserver =  local.nameserver
    ciuser = local.masters.ciuser
    sshkeys = local.sshkeys
    agent = local.agent
    clone = local.clone
    cores = local.masters.cores
    sockets = local.masters.sockets
    cpu_type = local.cpu_type
    memory = local.masters.memory
    scsihw = local.scsihw
    target_node = local.target_node

    name = format(
        "%s-%s",
        local.masters.name,
        count.index
    )

    network {
        id        = 0
        bridge    = local.network.bridge
        model     = local.network.model
    }

    ipconfig0 = format(
        "ip=%s/24,gw=%s",
        cidrhost(
        local.cidr,
        local.masters.last_octect + count.index
        ),
        cidrhost(local.cidr, 1)
    )

    serial {
        id   = 0
        type = local.serial.type
    }

    disk {
        backup  = local.disks.cloudinit.backup
        format  = local.disks.cloudinit.format
        type    = local.disks.cloudinit.type
        storage = local.disks.cloudinit.storage
        slot    = local.disks.cloudinit.slot
    }

    disk {
        backup  = local.disks.main.backup
        format  = local.disks.main.format
        type    = local.disks.main.type
        storage = local.disks.main.storage
        slot    = local.disks.main.slot
        discard = local.disks.main.discard
        size    = local.masters.size
    }
    
    connection {
        type        = "ssh"
        user        = local.masters.ciuser
        private_key = local.private_key
        host = cidrhost(
        local.cidr,
        local.masters.last_octect + count.index
        )
    }

    provisioner "remote-exec" {
        inline = [
        "cloud-init status --wait"
        ]
    }
}
