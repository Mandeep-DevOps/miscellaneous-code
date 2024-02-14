variable "tools" {
  default = {

    sonarqube = {
      instance_type = "t3.large"
      port          = 9000
      priority      = 100
      dns_names     = ["sonarqube"]
    }

    elasticsearch = {
      instance_type = "m6in.large"
      port          = 80
      priority      = 101
      dns_names     = ["elasticsearch"]
    }

    prometheus = {
      instance_type = "t3.small"
      port          = 9090
      priority      = 102
      dns_names     = ["prometheus", "grafana", "alertmanager"]
    }

  }
}
