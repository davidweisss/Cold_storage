transfer=$2

data=`cat $1|jq ".data"` 
utxoAmount=`cat $1|jq ".utxoAmount"` 
txIdIn=`cat $1|jq ".txIdIn"` 
addressIn=`cat $1|jq ".addressIn"` 
addressInPrivateKey="$3"
outputNumberIn=`cat $1|jq ".outputNumberIn"` 
payAmount=`cat $1|jq ".payAmount"` 
addressOut=`cat $1|jq ".addressOut"` 
txRateInSatPerByte=`cat $1|jq ".txRateInSatPerByte"` 
txSize=`cat $1|jq ".txSize"` 

satPerBitcoin=100000000 ## Def

minerFee=`echo $txSize' * '$txRateInSatPerByte' / '$satPerBitcoin|bc -l`
minerFee=`echo 0$minerFee|sed 's/0*$//g'`

## Compute transaction amounts
changeAmount=`echo $utxoAmount' - '$payAmount' - '$minerFee|bc -l`
changeAmount=`echo 0$changeAmount|sed 's/0*$//g'`

## Create tx     
rawTxUnsigned=`bitcoin-cli createrawtransaction '[{"txid":'$txIdIn',"vout":'$outputNumberIn'}]' '{'$addressOut':'$payAmount','$addressIn':'$changeAmount',"data":'$data'}'`

rawTxUnsignedDecoded=`bitcoin-cli decoderawtransaction $rawTxUnsigned`
scriptHashOut=`echo $rawTxUnsignedDecoded|jq -r '.vout|.[0].scriptPubKey.hex'`
scriptHashIn=`echo $rawTxUnsignedDecoded|jq -r '.vout|.[1].scriptPubKey.hex'`

## OFFLINE: Sign tx
rawTxSigned=`bitcoin-cli signrawtransactionwithkey $rawTxUnsigned '["'$addressInPrivateKey'"]' '[{"txid": '$txIdIn' ,"vout": '$outputNumberIn', "scriptPubKey": "'$scriptHashIn'", "redeemScript": "'$scriptHashOut'", "amount": '$utxoAmount'}]'`
rawTxSigned=`echo $rawTxSigned| jq -r '.hex'`
echo Writing raw signed transaction to $2

echo $rawTxSigned >> $transfer
echo `date`>> $transfer
cat $1 >> $transfer
