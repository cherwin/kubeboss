resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = var.k8s_clustername
  region  = var.region
  version = var.k8s_version

  tags = ["k8s"]

  node_pool {
    name       = var.k8s_poolname
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }

}

resource "local_file" "kubeconfig" {
  content = digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].raw_config
  filename = "${path.root}/kubeconfig"
}

output "cluster-id" {
  value = digitalocean_kubernetes_cluster.kubernetes_cluster.id
}
