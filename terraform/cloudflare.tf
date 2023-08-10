provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}

data "cloudflare_zone" "kflix_tv" {
  name = "kflix.tv"
}

resource "cloudflare_record" "directssh" {
  zone_id = data.cloudflare_zone.kflix_tv.zone_id
  name    = "directssh"
  value   = data.ovh_dedicated_server.kflix.ip
  type    = "A"
  ttl     = 3600
}
