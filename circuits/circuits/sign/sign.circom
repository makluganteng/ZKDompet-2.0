
include "../../circom-ecdsa/circuits/ecdsa.circom"

template TransactionCall() {
    signal input signatureR[4];
    signal input signatureS[4];
    signal public input transactionCallData[4];
    signal input ownerPubKey[2][4];
    signal input ownerPrivKey[4]

    component ECDSAPrivToPub_Instance = ECDSAPrivToPub(64,4)

    var resultPubKey = ECDSAPrivToPub_Instance.pubkey[2][4];

    component ECDSAVerifyNoPubkeyCheck_Instance = ECDSAVerifyNoPubkeyCheck(64, 4)

    for(var i = 0; i < 4; i++){
        ECDSAVerifyNoPubkeyCheck_Instance.r[i] <== signatureR[i];
        ECDSAVerifyNoPubkeyCheck_Instance.s[i] <== signatureS[i];
        ECDSAVerifyNoPubkeyCheck_Instance.msghash[i] <== transactionCallData[i];
    }
    
    for(var i = 0; i<2, i++){
        for(var n = 0; n<4, n++){       
            ECDSAVerifyNoPubkeyCheck_Instance.pubkey[i][n] <== ownerPubKey[i][n];
        }
    }    

    signal output result;
    result <== ECDSAVerifyNoPubkeyCheck_Instance.result

}