data "tfe_organization" "organization" {
  name = var.tfe_organization
}

data "tfe_project" "project" {
  organization = data.tfe_organization.organization.name
  name         = var.tfe_project
}

resource "tfe_workspace" "cloudflare" {
  name           = "cloudflare"
  organization   = data.tfe_organization.organization.name
  project_id     = data.tfe_project.project.id
  execution_mode = "local"
}

resource "tfe_workspace" "ovh-s3" {
  name           = "ovh-s3"
  organization   = data.tfe_organization.organization.name
  project_id     = data.tfe_project.project.id
  execution_mode = "local"
}