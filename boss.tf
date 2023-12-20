module "kubeboss" {
  source = "github.com/cherwin/kubeboss//digitalocean?ref=0.1.8"
}

module "bootstrap" {
  source = "github.com/cherwin/kubeboss//kubernetes?ref=0.1.8"

  kubeconfig = module.kubeboss.kubeconfig
}
