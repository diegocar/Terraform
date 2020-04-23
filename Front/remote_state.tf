terraform {
  backend "s3" {
    bucket = "remote-terraformstate"
    key    = "terraform/front/front.tfstate"
    region = "us-east-2"
  }
}
