resource "proxmox_virtual_environment_vm" "k3s_cp01" {
  name      = "k3s-cp01"
  node_name = "proxmox"
  vm_id     = 101

  clone {
    vm_id = 100
    full  = true
  }

  cpu {
    cores = 2
    type = "host"
  }

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }
}
