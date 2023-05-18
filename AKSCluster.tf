

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_B2s"  # Smallest VM size
    os_disk_size_gb = 30
  }

/*
  service_principal {
    client_id     = "<your-service-principal-client-id>"
    client_secret = "<your-service-principal-client-secret>"
  }
*/
  tags = {
    Environment = "Production"
    RU          = "100"
    CostCenter  = "12345"
  }
}

