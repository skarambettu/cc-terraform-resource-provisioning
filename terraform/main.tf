terraform {
  backend "azurerm" {
    resource_group_name = "sandesh-group1"
    storage_account_name = "sandeshblobstore"
    container_name       = "sandesh-test"
    key = "tfstate/projectA/dev/abcd.dev.tfstate"
  }
}

provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}

locals {
  sas    = jsondecode(file("./sas.json"))
  acls   = jsondecode(file("./acls.json"))
  apikeys    = jsondecode(file("./apikeys.json"))
}

locals {
  sas_with_name = [ for sa in local.sas.sas : sa if sa.name != "" ]
}

module "sa" {
  for_each = { for sa in local.sas_with_name : sa.name => sa }
  source   = "./modules/sa"
  sa       = each.value
}

locals {
  apikeys_with_principals = [ for apikey in local.apikeys.apikeys.kafka : apikey if apikey.principal != "" ]
}

module "apikey_kafka" {
  for_each = { for apikey in local.apikeys_with_principals : apikey.principal => apikey }
  source   = "./modules/apikey"
  env_id   = var.confluent_environment
  kafka_id = var.confluent_kafka_cluster
  apikey   = each.value
}