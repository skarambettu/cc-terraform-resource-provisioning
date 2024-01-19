variable "env_id" {
  type = string
}

variable "kafka_id" {
  type = string
}

variable "topic" {
  type = object({
    name       = string
    partitions = number
    config     = map(string)
  })
}

variable "admin_sa" {
  type = object({
    api_key    = string
    api_secret = string
  })
}