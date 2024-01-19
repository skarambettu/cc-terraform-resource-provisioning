data "confluent_kafka_cluster" "kafka_cluster" {
  id = var.kafka_id
  environment {
    id = var.env_id
  }
}

data "confluent_service_account" "sa" {
  display_name = var.apikey.principal
}

resource "confluent_api_key" "kafka-api-key" {
  display_name = "${data.confluent_service_account.sa.display_name}-kafka-api-key"
  description  = "Kafka API Key that is owned by ${data.confluent_service_account.sa.display_name} service account"
  owner {
    id          = data.confluent_service_account.sa.id
    api_version = data.confluent_service_account.sa.api_version
    kind        = data.confluent_service_account.sa.kind
  }

  managed_resource {
    id          = data.confluent_kafka_cluster.kafka_cluster.id
    api_version = data.confluent_kafka_cluster.kafka_cluster.api_version
    kind        = data.confluent_kafka_cluster.kafka_cluster.kind

    environment {
      id = var.env_id
    }
  }
}
