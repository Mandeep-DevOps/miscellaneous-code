variable "tools" {
  default = {

    sonarqube = {
      instance_type = "t3.large"
      port          = 9000
      priority      = 100
    }
  }

}
