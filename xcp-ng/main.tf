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

module "k3s_cluster" {
  cluster_name = "k3s test"
  source = "./k3s-xcp-ng"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjzLNsVcSiBUGK6tKicGamUXCE7FfWjX2VWpa8UFoNCfz+ICU8BzyUxFduin3+hig+ExbL2mUKIfHEAYWFOb578RjZHXzyfn9VgXw0s7w3dPgDC8KXmnar80XSaM3EdjI/QqKbCD9crTPY6tmQsABvj0M2DHL9GP40qspnjCeqv8TbEVhz1N+PdwWisWM2qeEsaKPyeHPT3l69lf3LDIDOChjsLuPNoGo/xJkeEjm6UayUBSAuYR4BF5KnxdE/96ap7ntDzlV2Sg4NMR17etSTRpLm7DX3edjWb/O/vBBcwL2NB/sDS9/FBMXWwrfdZBRuj3RheeCqTMPKU4voPa4Dl++QTAngSYlfDAj9dzVQ5afUJa9qr2bg26bb7f2Db3QZ5kWXmsu76ZIbe4hiGuyhOBwaSU1wJOnOkxVXFpc4WuT0zACbINvXbkfjqMY0Zo0rOIXL0CKdWcNu4lICaap106HJPxveNnjjKMR0PQ5dvuhokA7ExON7v1Y/LShvWL8= jeroen@jeroen-Presario-CQ57"
  xoa_pool = "xcp-ng-bgupshiu"
  xoa_network = "VMs1"
  xoa_template = "ubuntu-jammy-22.04-cloudimg-20230929"
  xoa_sr_id = "e616a056-ce17-bab9-b276-00928e4d5354"
  
  k3s_servers = {
    num = 1
    memory = 2048
    disk = 10000
    cores = 2
  }

  k3s_workers = {
    num = 3
    memory = 2048
    disk = 10000
    cores = 2
  }
}