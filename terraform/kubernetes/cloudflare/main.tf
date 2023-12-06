terraform {
  cloud {
    organization = "kilianty"
    workspaces {
      name = "cloudflare"

    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.20.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
  required_version = ">= 1.3.0"
}

data "http" "ipv4_lookup_raw" {
  url = "http://ipv4.icanhazip.com"
}

data "cloudflare_zone" "domain" {
  name = var.cloudflare_domain
}
