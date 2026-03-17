workload
│
├── networking   → VNet + Subnets
├── application  → App Service + Web App
├── services     → Storage + Key Vault
└── compute      → Jump Host VM
    webapp_deploy -> website deployed 

here we have created an Infrastructure which include web app, storage account, key-vault with vnet, subnets, nsgs, nics, and a jump-host-vm 
the main task is to create the complete infrastructure private and access the secret present in key-vault in the web app and show it on the page (accessing privately)