terraform {
  backend "s3" {
    bucket = "d77-terraform"
    key    = "misc/sonarqube/terraform.tfstate"
    region = "us-east-1"

  }
}
