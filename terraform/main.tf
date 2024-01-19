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

