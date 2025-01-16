#!/bin/bash

wget https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2

virt-customize --add Rocky-9-GenericCloud-Base.latest.x86_64.qcow2 --install qemu-guest-agent

qm create 1002 \
 --name rocky-9-cloud-init \
 --numa 0 \
 --ostype l26 \
  --cpu cputype=host \
  --cores 2 \
  --sockets 1 \
  --memory 2048 \
  --net0 virtio,bridge=vmbr0
  
qm importdisk 1002 Rocky-9-GenericCloud-Base.latest.x86_64.qcow2 local-lvm

qm set 1002 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-1002-disk-0

qm set 1002 --ide2 local-lvm:cloudinit

qm set 1002 --boot c --bootdisk scsi0

qm set 1002 --serial0 socket --vga serial0

qm set 1002 --agent enabled=1

qm disk resize 1002 scsi0 +20G

qm template 1002