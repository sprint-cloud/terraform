terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
    }
  }
}

provider "xenorchestra" {
   insecure = true
}