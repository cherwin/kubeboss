module "kubernetes" {
  source = "github.com/cherwin/kubeboss//do//kubernetes?ref=0.1.9"
}

module "bootstrap" {
  source = "github.com/cherwin/kubeboss//do//bootstrap?ref=0.1.9"
}
