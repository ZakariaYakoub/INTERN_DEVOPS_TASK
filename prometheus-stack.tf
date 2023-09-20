resource "helm_release" "prometheus-stack" {
  name       = "prometheus-stack"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-monitoring"
  
}