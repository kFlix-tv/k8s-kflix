terraform {
  cloud {
    organization = "kilianty"

    workspaces {
      name = "ovh"
    }
  }
  required_providers {
    ovh = {
      source = "ovh/ovh"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}