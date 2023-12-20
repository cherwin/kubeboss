provider "kubernetes" {}

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.7.0"
    }
  }
}

resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
