variable "project" {
  description = "Project to deploy resources for"
  type        = string
}

variable "project_env" {
  description = "Project environment to deploy resources for"
  type        = string
}

variable "confluent_cloud_api_key" {
  description = "Confluent cloud API Key"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent cloud API Secret"
  type        = string
}

variable "confluent_environment" {
  description = "ID of the Confluent Cloud environment environment"
  type        = string
}

variable "confluent_kafka_cluster" {
  description = "ID of the Confluent Cloud cluster to leverage (lkc)"
  type        = string
}

variable "kafka_api_key" {
  description = "Kafka API Key"
  type        = string
}

variable "kafka_api_secret" {
  description = "Kafka API Secret"
  type        = string
}

variable "CLIENT_ID" {
  description = "Client ID"
  type        = string
}

variable "CLIENT_SECRET" {
  description = "Client Secret"
  type        = string
}

variable "subscription_id" {
  description = "Kafka API Secret"
  type        = string
}

variable "tenant_id" {
  description = "Kafka API Secret"
  type        = string
}
