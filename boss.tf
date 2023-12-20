module "kubeboss" {
  source = "github.com/cherwin/kubeboss//digitalocean?ref=0.1.6"
}

module "bootstrap" {
  source = "github.com/cherwin/kubeboss//kubernetes?ref=0.1.7"

  provider "kubernetes" {
    host  = module.kubeboss.kubernetes_endpoint
    token = module.kubeboss.kubernetes_token
    cluster_ca_certificate = base64decode(
      module.kubeboss.kubernetes_cluster_ca_certificate
    )
  }
}
