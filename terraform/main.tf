resource "proxmox_virtual_environment_vm" "k3s_cp01" {
  name      = "k3s-control-01"
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

resource "proxmox_virtual_environment_vm" "k3s_workers" {
  count     = 3
  name      = "k3s-wk0${count.index + 1}"
  node_name = "proxmox"
  vm_id     = 102 + count.index

  clone {
    vm_id = 100
    full  = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 8192
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }
}
