#!/bin/bash

apt install libguestfs-tools -y

wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

virt-customize --add jammy-server-cloudimg-amd64.img \
 --install qemu-guest-agent

qm create 1001 \
 --name ubuntu-2204-cloud-init \
 --numa 0 \
 --ostype l26 \
  --cpu cputype=host \
  --cores 2 \
  --sockets 1 \
  --memory 2048 \
  --net0 virtio,bridge=vmbr0

qm importdisk 1001 jammy-server-cloudimg-amd64.img local-lvm

qm set 1001 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-1001-disk-0

qm set 1001 --ide2 local-lvm:cloudinit

qm set 1001 --boot c --bootdisk scsi0

qm set 1001 --serial0 socket --vga serial0

qm set 1001 --agent enabled=1

qm disk resize 1001 scsi0 +20G

qm template 1001