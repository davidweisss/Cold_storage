## Inputs input from full- internet-connected node
data="616d7a6e2063617264"
utxoAmount=0.1126
txIdIn="433d6ff012b5e6a21189ada80ea2edad6a080e4a4bc7956c49ac1b034fafb7bc"
addressIn="3Mt8B9LkZZaCoDueFVm5MEn8cbjKYjHPxQ"
addressInPrivateKey=""
outputNumberIn=1 ## (computable)
payAmount=0.00391120
addressOut="18S9sxPktsMkwuVHKAH8w3t3SMS5JcKhTo"
## Miner fee computation
txRateInSatPerByte=10
txSize=269

satPerBitcoin=100000000 ## Def

minerFee=`echo $txSize' * '$txRateInSatPerByte' / '$satPerBitcoin|bc -l`
minerFee=`echo 0$minerFee|sed 's/0*$//g'`

## Compute transaction amounts
changeAmount=`echo $utxoAmount' - '$payAmount' - '$minerFee|bc -l`
changeAmount=`echo 0$changeAmount|sed 's/0*$//g'`

## Create tx
rawTxUnsigned=`bitcoin-cli createrawtransaction '[{"txid": "'$txIdIn'","vout": '$outputNumberIn'}]' '{"'$addressOut'": '$payAmount',"'$addressIn'": '$changeAmount',"data": "'$data'"}'`

rawTxUnsignedDecoded=`bitcoin-cli decoderawtransaction $rawTxUnsigned`
scriptHashOut=`echo $rawTxUnsignedDecoded|jq -r '.vout|.[0].scriptPubKey.hex'`
scriptHashIn=`echo $rawTxUnsignedDecoded|jq -r '.vout|.[1].scriptPubKey.hex'`

## OFFLINE: Sign tx
rawTxSigned=`bitcoin-cli signrawtransactionwithkey $rawTxUnsigned '["'$addressInPrivateKey'"]' '[{"txid": "'$txIdIn'" ,"vout": '$outputNumberIn', "scriptPubKey": "'$scriptHashIn'", "redeemScript": "'$scriptHashOut'", "amount": '$utxoAmount'}]'`
rawTxSigned=`echo $rawTxSigned| jq -r '.hex'`

echo $rawTxSigned >> $transfer

## ONLINE: Send tx
bitcoin-cli sendrawtransaction $rawTransactionSigned 

## TODO: Message-to-hex with hexdump
