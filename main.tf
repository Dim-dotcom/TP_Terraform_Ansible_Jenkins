# provider "vsphere" {
#   user           = "administrator@vsphere.local"
#   password       = "inSpecTeuR!8"
#   vsphere_server = "192.168.64.100"
# }

resource "vsphere_datacenter" "dc" {
  name = "vsphere-datacenter"
}

resource "vsphere_compute_cluster" "cluster" {
  name          = "TP_cluster"
  datacenter_id = vsphere_datacenter.dc.id
}

resource "vsphere_network_interface" "nic" {
  adapter_type    = "vmxnet3"
  network_id      = "VM Network"
  use_static_mac  = true
  mac_address     = "00:50:56:XX:YY:ZZ"
  unit_number     = 0
}

resource "vsphere_virtual_machine" "ubuntu" {
  name             = "ubuntu"
  resource_pool_id = vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = "datastore1"
  num_cpus         = 2
  memory           = 2048
  guest_id         = "ubuntu22_64Guest"
  
  
  network_interface {
    network_id = vsphere_network_interface.nic.network_id
  }
  
  disk {
    label = "disk0"
    size  = "20"
  }
  
  cdrom {
    datastore_id = "datastore1"
    path        = "datastore1/iso/ubuntu-22.04.1-desktop-amd64.iso"
  }
  
#   clone {
#     template_uuid = "your_ubuntu_template_uuid"
#   }
 }

