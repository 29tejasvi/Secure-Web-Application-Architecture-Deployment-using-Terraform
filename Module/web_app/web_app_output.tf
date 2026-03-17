output "webApp_ids" {
  value = {
    for k, v in azurerm_linux_web_app.webapp:
    k => v.id
  }
}
output "webapp_principal_id" {
  value = {
    for k, v in azurerm_linux_web_app.webapp :
    k => v.identity[0].principal_id
  }
}