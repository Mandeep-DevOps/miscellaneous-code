variable "tools" {
  default = {

    sonarqube = {
      instance_type = "t3.large"
      port          = 9000
      priority      = 100
      policy_list   = []
    }

    elasticsearch = {
      instance_type = "m6in.large"
      port          = 80
      priority      = 101
      policy_list   = []
    }

    prometheus = {
      instance_type = "t3.small"
      port          = 9090
      priority      = 102
      policy_list   = [ "ec2:Describe*" ]
    }

    grafana = {
      instance_type = "t3.small"
      port          = 3000
      priority      = 103
      policy_list   = []
    }

    alertmanager = {
      instance_type = "t3.small"
      port          = 9093
      priority      = 104
      policy_list   = []
    }

    artifactory = {
      instance_type = "t3.medium"
      port          = 8082
      priority      = 105
      policy_list   = []
    }

    load-runner = {
      instance_type = "t3.small"
      port          = 80
      priority      = 106
      policy_list   = []
    }

  }
}
