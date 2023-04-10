import 'dart:convert';

import 'package:eth_sig_util/util/bytes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

import '../../../utils/constants.dart';
import '../../credential/controller/credential_controller.dart';

class VerificationController extends GetxController {
  TextEditingController credentialJson = TextEditingController();
  GlobalController globalController = Get.put(GlobalController());
  RxInt valid = 0.obs;

  @override
  void onInit() {
    credentialJson.addListener(() {
      valid.value = 0;
    });
    super.onInit();
  }

  verifyPresentation() async {
    var VP = jsonDecode(credentialJson.text);
    var holder = VP["holder"];
    var content = {...VPModel};
    var proof = VP["proof"];
    var signature = proof["proofValue"];
    content["@context"] = VP["@context"];
    content["type"] = VP["type"];
    content["holder"] = VP["holder"];
    content["verifiableCredential"] = VP["verifiableCredential"];

    print(content);
    var hash = sha3Digest(convertStringToUint8List(jsonEncode(content)));

    // print(bufferToHex(hash));
    // print(signature);

    var contractAddress = EthereumAddress.fromHex(holder);

    var contract = DeployedContract(
        ContractAbi.fromJson(jsonEncode(IdentifierABI), "Identifier"),
        contractAddress);

    var verify = contract.function("verify");
    var isValid = await globalController.ethClient.call(
        contract: contract,
        function: verify,
        params: [hexToBytes(signature), hash]);
    print(isValid[0]);
    valid.value = isValid[0] ? 1 : -1;
  }
}
