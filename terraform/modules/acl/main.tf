data "confluent_kafka_cluster" "kafka_cluster" {
  id = var.kafka_id
  environment {
    id = var.env_id
  }
}

data "confluent_service_account" "sa" {
  display_name = var.principal
}

resource "confluent_kafka_acl" "kafka-acl" {
  kafka_cluster {
    id = data.confluent_kafka_cluster.kafka_cluster.id
  }
  resource_type = var.resource_type
  resource_name = var.resource_name
  pattern_type  = var.pattern_type
  principal     = "User:${data.confluent_service_account.sa.id}"
  host          = var.host
  operation     = var.operation
  permission    = var.permission
  rest_endpoint = data.confluent_kafka_cluster.kafka_cluster.rest_endpoint
  credentials {
    key    = var.admin_sa.api_key
    secret = var.admin_sa.api_secret
  }
}
