terraform {
  backend "s3" {
    bucket = "d77-terraform"
    key    = "misc-code/all/terraform.tfstate"
    region = "us-east-1"

  }
}
