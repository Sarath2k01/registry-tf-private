terraform {
  required_version = ">= 1.3"

  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = ">= 1.0"
    }
  }
}