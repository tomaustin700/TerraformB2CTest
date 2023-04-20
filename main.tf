terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformB2C"
    storage_account_name = "terraformb2cta"
    container_name       = "tstate"
    key                  = "b2c.terraform.tfstate"

  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.48.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.37.2"
    }
  }

}


module "b2c" {
  source = "./b2c"

}

module "users" {
  source      = "./users"
  tenant_id   = module.b2c.tenant_id
  domain_name = module.b2c.domain_name

}
