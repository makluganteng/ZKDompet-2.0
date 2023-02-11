pragma circom 2.0.2;

include "../../circuits/ecdsa.circom";

// template Test(){
//     signal input privkey[4];
//     signal output pubkey[2][4]

//     component ECDSAPrivToPub_Instance = ECDSAPrivToPub(64, 4);

//     for(var i = 0; i<4; i++){
//         ECDSAPrivToPub_Instance.privkey[i] <== privkey[i];
//     }

//     for()
// }

component main = ECDSAPrivToPub(64, 4);
