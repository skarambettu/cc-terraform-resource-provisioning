variable "schema_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "schema" {
  type = object({
    subject = string
    format  = string
    path    = string
  })
}

variable "admin_sa" {
  type = object({
    api_key    = string
    api_secret = string
  })
}