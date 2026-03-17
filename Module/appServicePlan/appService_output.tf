output "asp_ids" {
  value = {
    for i, j in azurerm_service_plan.app_service_plan:
    i => j.id
  }
}