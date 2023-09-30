terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
    }
  }
}

data xenorchestra_pool "pool" {
    name_label = var.xoa_pool
}

data xenorchestra_network "net" {
    name_label = var.xoa_network
}

data xenorchestra_template "template" {
    name_label = var.xoa_template
}