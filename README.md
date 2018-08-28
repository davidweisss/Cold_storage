# Cold_storage
Process for cold storage in custodial bitcoin wallet apps

I have not found a simple enough cold storage process.

The idea is to securely produce a private key.

How to pysically secure this private key is left to the user.

Part 1/ is connected to the internet: downloading, configuring, building, installing... bitcoin.
Part 2/ Disconnected: create a wallet, output a private key.

I don't like the use of mnemonic phrases because they are not part of the core bitcoin protocol. It makes no sense to me to use a secure software to later use a third-party tool in a security-critical step.

So the implementation is probably quite simple because it's just a simple use case of bitcoin

Use cases
1/ Simple private key-based physical bitcoin
2/ Run an organization centrally linking a bitcoin address to each user (with/without managing private keys).
