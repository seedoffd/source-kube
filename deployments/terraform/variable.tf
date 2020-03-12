variable "deployment_environment" {
  
}

variable "deployment_image" {
  
}

variable "deployment_endpoint" {
  type = "map"

  default = {
    dev  = "dev.source-kube.fuchicorp.com"
    qa   = "qa.source-kube.fuchicorp.com"
    prod = "source-kube.fuchicorp.com"
  }
}