terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {

  pm_api_url  = var.server
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ansible-vm" {
  name       = "kien-ansible-vm"
  target_node = "kvm3"
  clone      = "ubuntu-22.04-template"
  cores      = 2
  memory     = 2048
  

  ipconfig0 = "ip=10.0.0.111/24,gw=10.0.0.1"
  ciuser = "ubuntu"
  cipassword = "011020"
  sshkeys = file("ntkkeypair.pub")
  network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
  }
  scsihw = "virtio-scsi-pci"
  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-raid"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "20G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-raid"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "db_vm" {
  name       = "kien-db-vm"
  target_node = "kvm3"
  clone      = "ubuntu-22.04-template"
  cores      = 2
  memory     = 2048
  ipconfig0 = "ip=10.0.0.112/24,gw=10.0.0.1"
  scsihw = "virtio-scsi-pci"
  ciuser = "ubuntu"
  cipassword = "011020"
  sshkeys = file("ntkkeypair.pub")
  network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
  }
  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-raid"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "20G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-raid"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "be_vm" {
  name       = "kien-be-vm"
  target_node = "kvm3"
  clone      = "ubuntu-22.04-template"
  cores      = 2
  memory     = 2048
  ipconfig0 = "ip=10.0.0.113/24,gw=10.0.0.1"
  scsihw = "virtio-scsi-pci"
  ciuser = "ubuntu"
  cipassword = "011020"
  sshkeys = file("ntkkeypair.pub")
  network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
  }
  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-raid"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "20G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-raid"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "fe_vm" {
  name       = "kien-fe-vm"
  target_node = "kvm3"
  clone      = "ubuntu-22.04-template"
  cores      = 2
  memory     = 2048
  ipconfig0 = "ip=10.0.0.114/24,gw=10.0.0.1"
  scsihw = "virtio-scsi-pci"
  ciuser = "ubuntu"
  cipassword = "011020"
  sshkeys = file("ntkkeypair.pub")
  network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
  }
  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-raid"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "20G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-raid"
        }
      }
    }
  }
}
