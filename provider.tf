terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }
     helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}