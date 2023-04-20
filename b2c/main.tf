provider "azurerm" {
  features {}
  skip_provider_registration = false
}

resource "azurerm_resource_provider_registration" "aad" {
  name = "Microsoft.AzureActiveDirectory"

}

resource "azurerm_aadb2c_directory" "b2c_tenant_live" {
  country_code            = "GB"
  data_residency_location = "Europe"
  display_name            = "tab2ctest"
  domain_name             = "tab2ctest12345.onmicrosoft.com"
  resource_group_name     = "TerraformB2C"
  sku_name                = "PremiumP1"


}
