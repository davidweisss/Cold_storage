Following common advice to manage your own bitcoin and after trying to start bitcoin ventures I needed: 

# A series of steps and materials for secure self-storage of bitcoin

The design is based on 2 principles:
- your private key hard copy, if destroyed, is the last place where it will ever occur in all of conceivable time and space
- achieve with as little dependencies as possible other than bitcoin and linux source code

## Steps of process

Probably automatable with minor headache but interactive rn.

1. Offline Delete Drives Securely
2. Offline Setup Transfer and Backup Drives


3. Online setup OS and configure server, with offline bitcoin installation

Interactive step.
Temporarily enable wifi and connect, change password.

```
sudo raspi-config
## Or only change password
passwd
```

Automatic

`. onlineNodeConfigAndOfflineBitcoinInstall.sh`

From here on can transfer to air-gapped computer

4. Offline Create Keys

`. offlineCreateKeysAndDeleteSource.sh`

It is possible to browse transactions from an online full node and copy them by hand, as well as addressess etc. Signed transaction hex is very long and tedious. Depending on security criticality the transfer drive can be used as clipboard between online full node and air-gapped node.

5. -- (optional) backup and checksum

6. -- (optional) transfer tx data from online to air-gapped computers 

7. Offline Transaction Create and Sign

```
. offlineTxCreateAndSign.sh res.txt 
## Inputs input from full- internet-connected node
´{"data"="",
"utxoAmount"=,
"txIdIn"="",
addressIn="",
addressInPrivateKey="",
outputNumberIn= , ## (computable)
payAmount=,
addressOut="",
## Miner fee computation
txRateInSatPerByte=10,
txSize=269}´
```

8. Transfer of signed transaction from offline to online through transfer drive
9. Online Verify Transactions
10. Online Send Signed Transaction
11. Offline delete Drives Securely

The process is designed so that the keys have have never touched the internet at any time. But there is always a risk, hat increases as time passes and the number of operations increases. Therefore, it can be convenient to securely destroy the keys from source computer by programs, or by physical destruction of the media. 
After this, the keys only exist on your hard copy(ies) of it!!

!!No force in the universe will get this key back to you ever.!!

## List of materials
- 3 micro SD cards
- 1-3 micro SD to USB adaptor
- 2 Raspberry Pi B+ plus power source
- 2 Screens, HDMI cables, screen power cables

https://www.wired.com/story/coinbase-physical-vault-to-secure-a-virtual-currency/
https://denarium.com/
