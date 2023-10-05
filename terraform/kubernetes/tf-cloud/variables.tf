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

variable "BUCKET_NAME" {
  type = string
}

variable "BUCKET_HOST" {
  type = string
}

variable "AWS_ACCESS_KEY_ID" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}