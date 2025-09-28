# Root module management_groups
data "azurerm_client_config" "current" {}

# Create Management Groups
resource "azurerm_management_group" "cyber_nimbus" {
  display_name                = "Cyber Nimbus"
  parent_management_group_id   = var.root_management_group_id
}

# Create Management Groups
resource "azurerm_management_group" "Platform" {
  display_name                = "Platform"
  parent_management_group_id   = azurerm_management_group.cyber_nimbus.id
}

# Create Management Groups
resource "azurerm_management_group" "legacy" {
  display_name                = "Legacy"
  parent_management_group_id   = azurerm_management_group.cyber_nimbus.id
}

resource "azurerm_management_group" "Sandbox" {
  display_name                = "Sandbox"
  parent_management_group_id   = azurerm_management_group.cyber_nimbus.id
}

# Create Management Groups
resource "azurerm_management_group" "Management" {
  display_name                = "Management"
  parent_management_group_id   = azurerm_management_group.Platform.id
}

# Create Management Groups
resource "azurerm_management_group" "Connectivity" {
  display_name                = "Connectivity"
  parent_management_group_id   = azurerm_management_group.Platform.id
}

# Create Management Groups
resource "azurerm_management_group" "Security" {
  display_name                = "Security"
  parent_management_group_id   = azurerm_management_group.Platform.id
}

# Create Management Groups
resource "azurerm_management_group" "landing_zones" {
  display_name                = "Landing Zones"
  parent_management_group_id   = azurerm_management_group.cyber_nimbus.id
}

# Create Management Groups for private resources
resource "azurerm_management_group" "corp" {
  display_name                = "Corp"
  parent_management_group_id   = azurerm_management_group.landing_zones.id
}

# Create Management Groups for public resources
resource "azurerm_management_group" "online" {
  display_name                = "Online"
  parent_management_group_id   = azurerm_management_group.landing_zones.id
}