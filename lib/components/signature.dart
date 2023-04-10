import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/constants.dart';
import 'package:web3dart/crypto.dart';
import '../service/secp256k1.dart' as secp256k1;

GlobalController globalController = Get.put(GlobalController());

class Signature {
  static Future<MsgSignature> signToSignature(Uint8List payload,
      {int? chainId, bool isEIP1559 = false}) async {
    final signature = secp256k1.sign(keccak256(payload), hexToBytes(globalController.db.read(Const.privateKey)));

    // https://github.com/ethereumjs/ethereumjs-util/blob/8ffe697fafb33cefc7b7ec01c11e3a7da787fe0e/src/signature.ts#L26
    // be aware that signature.v already is recovery + 27
    int chainIdV;
    if (isEIP1559) {
      chainIdV = signature.v - 27;
    } else {
      chainIdV = chainId != null
          ? (signature.v - 27 + (chainId * 2 + 35))
          : signature.v;
    }
    return MsgSignature(signature.r, signature.s, chainIdV);
  }
}