terraform {
  required_providers{
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.24.0"
    }
     aws = {
      source = "hashicorp/aws"
      version = "3.24.0"
    }
     random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }
}


