variable "region" {
  default = "ams3"
}

variable "cluster_name" {
  default = "bosscluster"
}

variable "k8s_version" {
  default = "1.28.2-do.0"
}

variable "k8s_poolname" {
  default = "worker-pool"
}

variable "k8s_count" {
  default = "3"
}
