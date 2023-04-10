import 'dart:convert';
import 'dart:typed_data';
import 'package:eth_sig_util/eth_sig_util.dart';
import 'package:eth_sig_util/util/bytes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointycastle/digests/sha3.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

Uint8List sha3Digest(Uint8List dataToDigest) {
  final d = SHA3Digest(256);

  return d.process(dataToDigest);
}

Uint8List convertStringToUint8List(String str) {
  final List<int> codeUnits = str.codeUnits;
  final Uint8List unit8List = Uint8List.fromList(codeUnits);
  return unit8List;
}

class CredentialController extends GetxController {
  TextEditingController credentialInput = TextEditingController();
  RxList credentials = [].obs;
  GlobalController globalController = Get.put(GlobalController());
  late QrImage qrImage;

  @override
  onInit() {
    super.onInit();
    // globalController.db.remove(Const.credentialKey);
    getCredentialList();
  }

  importCredential() async {
    try {
      var credentials = globalController.db.read(Const.credentialKey);
      var list = credentials == null ? [] : List.from(jsonDecode(credentials));
      List finalList = [];

      for (int i = 0; i < list.length; i++) {
        finalList.add(jsonEncode(list[i]));
      }
      finalList.add(jsonEncode(credentialInput.text));
      await globalController.db
          .write(Const.credentialKey, finalList.toString());
      getCredentialList();
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  getCredentialList() {
    var string = globalController.db.read(Const.credentialKey);
    if (string != null) {
      credentials.value = List.from(jsonDecode(string));
    }
  }

  deleteCredential(int index) async {
    try {
      var credentials = globalController.db.read(Const.credentialKey);

      var list = List.from(jsonDecode(credentials));
      List finalList = [];

      for (int i = 0; i < list.length; i++) {
        finalList.add(jsonEncode(list[i]));
      }

      finalList.removeAt(index);
      await globalController.db
          .write(Const.credentialKey, finalList.toString());
      getCredentialList();
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  qrGenerate(int index) {
    try {
      var json = (jsonEncode(credentials[index]));
      return json;
    } catch (err) {
      print(err);
      return "";
    }
  }

  createPresentation(int index) {
    try {
      var json = (jsonDecode(credentials[index]));
      // print(jsonEncode(json));
      var newVP = {...VPModel};
      newVP["verifiableCredential"] = [json];
      newVP["holder"] = globalController.did.value;
      // print(jsonEncode(newVP));
      var hash = sha3Digest(convertStringToUint8List(jsonEncode(newVP)));
      print(bufferToHex(hash));
      final signature = EthSigUtil.signMessage(
          privateKey: globalController.db.read(Const.privateKey),
          message: (hash));
      print (signature);
      var proof = {...presentationProofModel};
      proof["created"] = DateTime.now().toString();
      proof["proofValue"] = signature;
      newVP["proof"] = proof;
      // print(jsonEncode(newVP));
      return jsonEncode(newVP);
    } catch (err) {
      print(err);
      return "";
    }
  }



}
