terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}