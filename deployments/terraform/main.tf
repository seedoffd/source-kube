module "source-kube_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "source-kube-deployment"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}"
  deployment_path        = "source-kube"

  template_custom_vars = {
    deployment_image = "${var.deployment_image}"
  }
}