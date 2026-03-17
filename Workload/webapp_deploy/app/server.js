// const { DefaultAzureCredential } = require("@azure/identity");
// const { SecretClient } = require("@azure/keyvault-secrets");

// const keyVaultName = process.env.KEYVAULT_NAME;
// const secretName = process.env.SECRET_NAME;

// const kvUri = `https://${keyVaultName}.vault.azure.net`;

// async function getSecret() {
// const credential = new DefaultAzureCredential();
// const client = new SecretClient(kvUri, credential);

// ```
// const secret = await client.getSecret(secretName);

// console.log("Secret value:", secret.value);
// ```

// }

// getSecret();

const express = require("express");
const app = express();

const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
    const secret = process.env.DEMO_SECRET || "Secret not found";
    res.send(`<h1>Key Vault Secret</h1><p>${secret}</p>`);
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
