terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  project = "govtech-cloud-assignment"
  region  = "us-central1"
}