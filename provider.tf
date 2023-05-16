terraform {
    required_providers {
        vsphere = {
            source = "hashicorp/vsphere"
            version = "2.3.1"
        }
    }
}

provider "vsphere" {
    user = "administrator@vsphere.local"
    password = "inSpecTeuR!8"
    vsphere_server = "192.168.64.100"
    allow_unverified_ssl = true
}