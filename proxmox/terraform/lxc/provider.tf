terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
