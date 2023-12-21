resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = var.cluster_name
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

output "kubeconfig" {
  value = "${path.root}/kubeconfig"
}

output "cluster-id" {
  value = digitalocean_kubernetes_cluster.kubernetes_cluster.id
}

output "kubernetes_endpoint" {
  value = digitalocean_kubernetes_cluster.kubernetes_cluster.endpoint
  
}

output "kubernetes_token" {
  value = digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].token
}

output "kubernetes_cluster_ca_certificate" {
  value = digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].cluster_ca_certificate
}


