data "confluent_service_account" "sa" {
  display_name = var.principal
}

resource "confluent_role_binding" "rb" {
  principal   = "User:${data.confluent_service_account.sa.id}"
  role_name   = var.role
  crn_pattern = var.crn
}