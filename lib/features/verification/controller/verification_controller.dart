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

  verifyPresentation(String json) async {
    var VP = jsonDecode(json);
    var holder = VP["holder"];
    var content = {...VPModel};
    var proof = VP["proof"];
    var signature = proof["proofValue"];
    content["@context"] = VP["@context"];
    content["type"] = VP["type"];
    content["holder"] = VP["holder"];
    content["verifiableCredential"] = VP["verifiableCredential"];

    // print(content);
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
    if (isValid[0]) {
      // var listCredential = List.from(jsonDecode(jsonEncode(content["verifiableCredential"])));
      // for (int i = 0; i < listCredential.length; i++) {
      //   print(listCredential[i]);
      //   var VCValid = await verifyCredential(listCredential[i]);
      //   if (!VCValid) {
      //     valid.value = -1;
      //     return;
      //   }
      // }
      valid.value = 1;
    } else
    valid.value = -1;
  }

  verifyCredential(Map<String, dynamic> VC) async {
    // var VC = jsonDecode(json);
    var issuer = VC["issuer"];
    var content = {...VCModel};
    var proof = VC["proof"];
    var signature = proof["proofValue"];
    content["@context"] = VC["@context"];
    content["type"] = VC["type"];
    content["issuer"] = VC["issuer"];
    content["issuanceDate"] = VC["issuanceDate"];
    content["credentialSubject"] = VC["credentialSubject"];

    var hash = sha3Digest(convertStringToUint8List(jsonEncode(content)));
    var contractAddress = EthereumAddress.fromHex(issuer);

    var contract = DeployedContract(
        ContractAbi.fromJson(jsonEncode(IdentifierABI), "Identifier"),
        contractAddress);

    var verify = contract.function("verify");
    var isValid = await globalController.ethClient.call(
        contract: contract,
        function: verify,
        params: [hexToBytes(signature), hash]);
    print(isValid[0]);
    return isValid[0];
  }
}
