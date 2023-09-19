terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
    config_path = "/home/admin/.kube/config"
}

resource "kubectl_manifest" "myapp" {
  yaml_body = <<-EOT
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  labels:
    app: myapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: zikou/hello-world:1.0
        ports:
        - containerPort: 3000
EOT
}

resource "kubectl_manifest" "myappservice" {
  yaml_body = <<-EOT
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
  labels:
    app: myapp
spec:
  selector:
    app: myapp
  type: ClusterIP
  ports:
  - protocol: TCP
    port: 3000
    targetPort: 3000
EOT
}