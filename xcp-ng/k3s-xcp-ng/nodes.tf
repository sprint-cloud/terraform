resource "xenorchestra_cloud_config" "node_config" {
  name = "k3s node cloud config"
  template = templatefile("${path.module}/cloud_config.tftpl", {
    ssh_authorized_keys = var.ssh_public_key
    apt_upgrade = var.apt_upgrade
  })
}


resource "xenorchestra_vm" "k3s_servers" {
    count = var.k3s_servers.num
    name_label = "${var.cluster_name}-server-${count.index + 1}"
    name_description = "K3s server node created by Terraform"
    cpus = var.k3s_servers.cores
    memory_max = var.k3s_servers.memory * pow(1024,2)
    template = data.xenorchestra_template.template.id
    affinity_host = data.xenorchestra_pool.pool.master
    cloud_config = xenorchestra_cloud_config.node_config.template

    network {
        network_id = data.xenorchestra_network.net.id
    }

    disk {
        sr_id = var.xoa_sr_id
        name_label = "${var.cluster_name}-server-${count.index + 1}"
        size = var.k3s_servers.disk * pow(1024,2)
    }

    tags = [
        "terraform",
        "k3s",
        var.cluster_name
    ]
    timeouts {
      create = "20m"
    }
  
}

resource "xenorchestra_vm" "k3s_workers" {
    count = var.k3s_workers.num
    name_label = "${var.cluster_name}-worker-${count.index + 1}"
    name_description = "K3s worker node created by Terraform"
    cpus = var.k3s_workers.cores
    memory_max = var.k3s_workers.memory * pow(1024,2)
    template = data.xenorchestra_template.template.id
    affinity_host = data.xenorchestra_pool.pool.master
    cloud_config = xenorchestra_cloud_config.node_config.template

    network {
        network_id = data.xenorchestra_network.net.id

    }

    disk {
        sr_id = var.xoa_sr_id
        name_label = "${var.cluster_name}-worker-${count.index + 1}"
        size = var.k3s_workers.disk * pow(1024,2)
    }

    tags = [
        "terraform",
        "k3s",
        var.cluster_name
    ]
    timeouts {
      create = "20m"
    }
}