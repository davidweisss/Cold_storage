# Cold_storage
Process for cold storage in custodial bitcoin wallet apps

I have not found a simple enough cold storage process.

The idea is to securely produce a private key.

How to pysically secure this private key is left to the user.

- Part 1/ is connected to the internet: downloading, configuring, building, installing... bitcoin.
- Part 2/ Disconnected: create a wallet, output a private key.

I don't like the use of mnemonic phrases because they are not used in the data dump formats where it is safest to trust the data (At the source: it makes no sense to me to use a secure software to later use many add-ons and even third-party tool in a security-critical step, without specific reason.)

So the implementation is relatively simple because it's just a simple use case of bitcoin

Use cases
- 1/ Simple private key-based physical bitcoin
- 2/ Run an organization centrally linking a bitcoin address to each user (with/without managing private keys).

https://www.wired.com/story/coinbase-physical-vault-to-secure-a-virtual-currency/
https://denarium.com/
