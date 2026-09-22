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
  count     = 2
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

resource "proxmox_virtual_environment_vm" "storage_identity_01" {
  name      = "storage-01"
  node_name = "proxmox"
  vm_id     = 104

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 6144
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 30
    file_format  = "raw"
  }
}
