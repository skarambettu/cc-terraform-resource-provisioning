resource "confluent_service_account" "sa" {
  display_name = var.sa.name
  description  = "Service account ${var.sa.name} creation"
}
