locals {
    unprivileged = true
    feature_nesting = true
    storage = "local-lvm"
    network_name   = "eth0"
    network_bridge = "vmbr0"
    ipv6    = "dhcp"
    cidr        = "192.168.0.0/24"
    ostemplate = "local:vztmpl/rockylinux-9-default_20240912_amd64.tar.xz"
    password     = "tocomfome@10"
    target_node  = "pve"
    onboot       = true
    start        = true
    ssh_public_keys = file("~/.ssh/id_rsa.pub")
    database = {
       count    = 1
       name     = "zbxdb"
       cores    = 2
       memory   = "1024"
       swap     = "2048"
       size     = "8G"
       last_octect = 30
       lxc_user = "root"
    }
    server = {
       count    = 1
       name     = "zbxsrv"
       cores    = 2
       memory   = "1024"
       swap     = "2048"
       size     = "8G"
       last_octect = 40
    }
    web = {
       count    = 1
       name     = "zbxweb"
       cores    = 2
       memory   = "1024"
       swap     = "2048"
       size     = "8G"
       last_octect = 50
    }
    proxy = {
       count    = 1
       name     = "zbxprx"
       cores    = 2
       memory   = "1024"
       swap     = "2048"
       size     = "8G"
       last_octect = 60
    }
}