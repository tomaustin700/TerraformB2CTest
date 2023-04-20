
provider "azuread" {
  tenant_id = var.tenant_id
}

resource "azuread_invitation" "b2c_user" {
  user_email_address = "firstname.lastname@gmail.com"
  user_display_name  = "Firstname Lastname"
  redirect_url       = "https://portal.azure.com"
  message {
    body = "You have been added to a new B2C Tenant"
  }

}

resource "azuread_directory_role" "global_admin" {
  display_name = "Global Administrator"
}

resource "azuread_directory_role_assignment" "role_assignment" {
  role_id             = azuread_directory_role.global_admin.template_id
  principal_object_id = azuread_invitation.b2c_user.user_id
}
