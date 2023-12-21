terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.7.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

data "digitalocean_kubernetes_cluster" "this" {
  name = var.cluster_name
} 

provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.this.endpoint
  token = data.digitalocean_kubernetes_cluster.this.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  )
}

resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
