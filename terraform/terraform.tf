terraform {
  cloud {
    organization = "kilianty"

    workspaces {
      name = "ovh"
    }
  }
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.34.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
