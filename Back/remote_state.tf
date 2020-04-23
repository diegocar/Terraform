terraform {
  backend "s3" {
    bucket = "remote-terraformstate"
    key    = "terraform/back/back.tfstate"
    region = "us-east-2"
  }
}
