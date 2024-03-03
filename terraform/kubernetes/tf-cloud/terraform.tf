terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.52.0"
    }
  }
  backend "s3" {
    bucket     = var.BUCKET_NAME
    key        = "terraform.tfstate"
    region     = "us-east-1"
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    endpoints {
      s3 = var.BUCKET_HOST
    }
  }
}
