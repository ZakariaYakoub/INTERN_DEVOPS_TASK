provider "helm" {}

resource "helm_release" "prometheus-stack" {
  name       = "prometheus-stack"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

}