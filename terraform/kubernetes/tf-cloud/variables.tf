variable "tfe_token" {
  type      = string
  sensitive = true
}

variable "tfe_organization" {
  type = string
}

variable "tfe_project" {
  type = string
}