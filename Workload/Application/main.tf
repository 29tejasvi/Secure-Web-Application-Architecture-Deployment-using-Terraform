# first we will create an App service plan

module "appServicePlan" {
  source = "../../Module/appServicePlan"
  rg_name = data.azurerm_resource_group.my_assigned_rg.name
  rg_location = data.azurerm_resource_group.my_assigned_rg.location
  app_service_plan = var.app_service_plan
  tags = var.tags
}

module "web_app" {
  source = "../../Module/web_app"
  rg_location = data.azurerm_resource_group.my_assigned_rg.location
  rg_name = data.azurerm_resource_group.my_assigned_rg.name
  web_app = var.web_app
  asp_ids = module.appServicePlan.asp_ids
  tags = var.tags
  depends_on = [ module.appServicePlan ]
}


