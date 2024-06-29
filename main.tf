# Create a resource group
resource "azurerm_resource_group" "aks" {
  name     = "aksResourceGroup"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "aks" {
  name                = "aksVnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
}

# Create a subnet
resource "azurerm_subnet" "aks" {
  name                 = "aksSubnet"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name
  address_prefixes     = ["10.1.1.0/24"]
}

# Create an AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aksCluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "aksdns"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.aks.id
  }
  

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}


