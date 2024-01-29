data "confluent_schema_registry_cluster" "schema_registry" {
  id = var.schema_id
  environment {
    id = var.env_id
  }
}

data "confluent_service_account" "sa" {
  display_name = var.apikey.principal
}

resource "confluent_api_key" "sr-api-key" {
  display_name = "${data.confluent_service_account.sa.display_name}-sr-api-key"
  description  = "Kafka API Key that is owned by ${data.confluent_service_account.sa.display_name} service account"
  owner {
    id          = data.confluent_service_account.sa.id
    api_version = data.confluent_service_account.sa.api_version
    kind        = data.confluent_service_account.sa.kind
  }

  managed_resource {
    id          = data.confluent_schema_registry_cluster.schema_registry.id
    api_version = data.confluent_schema_registry_cluster.schema_registry.api_version
    kind        = data.confluent_schema_registry_cluster.schema_registry.kind

    environment {
      id = var.env_id
    }
  }
}