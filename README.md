workload
│
├── networking   → Creates VNet + Subnets
├── application  → Creates App Service + Web App
├── services     → Creates Storage + Key Vault
└── compute      → Creates Jump Host VM
    webapp_deploy -> website deployed 

here we have created an Infrastructure which include web app, storage account, key-vault with vnet, subnets, nsgs, nics, and a jump-host-vm 
the main task is to create the complete private infrastructure and access the secret present inside key-vault in the web app and show it on the deployed page (accessing privately)
