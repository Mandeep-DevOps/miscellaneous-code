variable "tools" {
  default = {

    sonarqube = {
      instance_type = "t3.large"
      port          = 9000
      priority      = 100
    }

    elasticsearch = {
      instance_type = "m6in.large"
      port          = 80
      priority      = 101
    }

    prometheus = {
      instance_type = "t3.small"
      port          = 9090
      priority      = 102
    }

    grafana = {
      instance_type = "t3.small"
      port          = 3000
      priority      = 103
    }

    alertmanager = {
      instance_type = "t3.small"
      port          = 9093
      priority      = 104
    }

    artifactory = {
      instance_type = "t3.medium"
      port          = 8081
      priority      = 105
    }

  }
}
