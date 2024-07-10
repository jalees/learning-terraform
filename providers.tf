terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    net = {
      source = "hashicorp/net"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}
