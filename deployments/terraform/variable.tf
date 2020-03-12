variable "deployment_environment" {
  
}

variable "deployment_image" {
  
}

variable "deployment_endpoint" {
  type = "map"

  default = {
    dev  = "dev.smart.fuchicorp.com"
    qa   = "qa.smart.fuchicorp.com"
    prod = "smart.fuchicorp.com"
  }
}