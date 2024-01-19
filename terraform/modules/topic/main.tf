data "confluent_kafka_cluster" "kafka_cluster" {
  id = var.kafka_id
  environment {
    id = var.env_id
  }
}

resource "confluent_kafka_topic" "topic" {
  kafka_cluster {
    id = data.confluent_kafka_cluster.kafka_cluster.id
  }
  topic_name       = var.topic.name
  partitions_count = var.topic.partitions
  rest_endpoint    = data.confluent_kafka_cluster.kafka_cluster.rest_endpoint

  credentials {
    key    = var.admin_sa.api_key
    secret = var.admin_sa.api_secret
  }
  config = var.topic.config
}