provider "google" {
  project = "terraform-cloudrun-attack"
  region  = "asia-northeast1"
}


terraform {
  required_version = ">= 1.8.0"

  backend "gcs" {
    bucket = "terraform-cloudrun-attack-tfstate"
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}
