variable "xoa_insecure" {
    type = bool
    default = false
    description = "Set the the connection to the XOA api to insecure"
}

variable "xoa_pool" {
    type = string
    description = "Name of XOA pool"
}

variable "xoa_network" {
    type = string
    description = "Name of XOA network"
}

variable "xoa_template" {
    type = string
    description = "Name of XOA template to use for nodes"
}

variable "xoa_sr_id" {
    type = string
    description = "Id of XOA storage repo to use for node disks"
}

variable "cluster_name" {
  description = "Name of K3s cluster"
  type = string
}

variable "ssh_public_key" {
    type = string
    description = "Public ssh key to allow acces to nodes"
}

variable "apt_upgrade" {
    type = bool
    default = false
    description = "Perform apt upgrade on nodes"
}
variable "k3s_servers" {
  type = object({
    num = number
    cores = number
    memory = number
    disk = number
  })
}

variable "k3s_workers" {
  type = object({
    num = number
    cores = number
    memory = number
    disk = number
  })
}