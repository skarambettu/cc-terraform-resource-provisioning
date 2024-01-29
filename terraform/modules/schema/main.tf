data "confluent_schema_registry_cluster" "schema_registry" {
  id = var.schema_id
  environment {
    id = var.env_id
  }
}

resource "confluent_schema" "schema" {
  schema_registry_cluster {
    id = data.confluent_schema_registry_cluster.schema_registry.id
  }
  rest_endpoint = data.confluent_schema_registry_cluster.schema_registry.rest_endpoint
  subject_name = "${var.schema.subject}"
  format = var.schema.format
  schema = file(var.schema.path)
  credentials {
    key    = var.admin_sa.api_key
    secret = var.admin_sa.api_secret
  }
}