provider "ovh" {
  endpoint           = "ovh-ca"
  application_key    = var.OVH_APPLICATION_KEY
  application_secret = var.OVH_APPLICATION_SECRET
  consumer_key       = var.OVH_CONSUMER_KEY
}

resource "ovh_me_ssh_key" "key" {
  key_name = "1p_ed5519"
  key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/N2/8p/v59RsRTgSCa7RjlYK89V/FEfXDKjnibhvO+"
}

data "ovh_dedicated_server" "kflix" {
  service_name = local.kflix_server
}

data "ovh_dedicated_server_boots" "rescue" {
  service_name = local.kflix_server
  boot_type    = "rescue"
}

resource "ovh_me_installation_template" "ubuntu" {
  base_template_name = local.template_os_name
  template_name      = "ubuntu22"
  default_language   = "en"

  customization {
    custom_hostname = "kflix"
    ssh_key_name    = ovh_me_ssh_key.key.key_name
  }
}

resource "ovh_dedicated_server_install_task" "server_install" {
  service_name      = local.kflix_server
  template_name     = ovh_me_installation_template.ubuntu.template_name
  bootid_on_destroy = data.ovh_dedicated_server_boots.rescue.result[0]
  details {
    disk_group_id = 2
  }
}