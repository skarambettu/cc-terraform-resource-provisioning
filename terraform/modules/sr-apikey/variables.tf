variable "schema_id" {
    type = string
}

variable "env_id" {
    type = string
}

variable "apikey" {
  type = object({
    principal = string
  })
}