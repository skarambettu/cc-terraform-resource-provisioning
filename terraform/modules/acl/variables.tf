variable "env_id" {
  type = string
}

variable "kafka_id" {
  type = string
}

variable "principal" {
  type = string
}

variable "resource_type" {
  type = string
}

variable "resource_name" {
  type = string
}

variable "operation" {
  type = string
}

variable "host" {
  type = string
}

variable "pattern_type" {
  type = string
}

variable "permission" {
  type = string
}

variable "admin_sa" {
  type = object({
    api_key    = string
    api_secret = string
  })
}
