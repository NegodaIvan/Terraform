variable "token_hc" { }
variable "access_key" { }
variable "secret_key" { }



provider "hcloud" {
  token     = var.token_hc
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "eu-central-1"
}

provider "random" {
}
