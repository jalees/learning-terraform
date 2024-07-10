terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      source = "hashicorp/net"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}

provider "net" {
  region  = "us-west-2"
}