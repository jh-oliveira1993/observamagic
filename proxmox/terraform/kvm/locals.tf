locals {
    scsihw      = "virtio-scsi-pci"
    cpu_type    = "host"
    clone       = "ubuntu-2204-cloud-init"
    agent       = 1
    nameserver  = "192.168.0.235"
    sshkeys     = file("~/.ssh/id_rsa.pub")
    private_key = file("~/.ssh/id_rsa")
    target_node = "pve"
    cidr        = "192.168.0.0/24"
    
    network = {
        bridge  = "vmbr0"
        model   = "virtio"
    }
    
    serial = {
        type    = "socket"
    }

    disks = {
        main = {
            backup  = true
            format  = "raw"
            type    = "disk"
            storage = "local-lvm"
            slot    = "scsi0"
            discard = true
        }
        cloudinit = {
            backup  = true
            format  = "raw"
            type    = "cloudinit"
            storage = "local-lvm"
            slot    = "ide2"
        }
    }

    masters = {
        memory  = 2048
        cores   = 2
        sockets = 1
        ciuser  = "ubuntu"
        vmid    = 800
        size    = "30G"
        count   = 1
        name    = "master"
        last_octect = 80
    }

    workers = {
        memory  = 2048
        cores   = 2
        sockets = 1
        ciuser  = "ubuntu"
        vmid    = 900
        size    = "30G"
        count   = 2
        name    = "worker"
        last_octect = 90
    }
}