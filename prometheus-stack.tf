provider "helm" {
kubernetes {
    config_path = "/home/admin/.kube/config"
  }
}

resource "helm_release" "prometheus-stack" {
  name       = "prometheus-stack"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

}