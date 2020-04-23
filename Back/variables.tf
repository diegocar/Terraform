variable "volumen_tags" {
  type = "map"
  default = {
    responsible : "dcarvajalc",
    project : "dcarvajalc-rampup"
  }
}

variable "instance_tags" {
  type = "map"
  default = {
    Name : "terraform_test",
    responsible : "dcarvajalc",
    project : "dcarvajalc-rampup"
  }
}

variable "instance_type"{
  type = string
  default = "t2.micro"
}
variable "project_name" {
  type = string
  default = "Tf-Back"
}