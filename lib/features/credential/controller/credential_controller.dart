import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

      for (int i = 0; i< list.length; i++) {
        finalList.add(jsonEncode(list[i]));
      }
      finalList.add(jsonEncode(credentialInput.text));
      await globalController.db.write(Const.credentialKey, finalList.toString());
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
      await globalController.db.write(
          Const.credentialKey, finalList.toString());
      getCredentialList();
      return true;
    } catch(err) {
      print(err);
      return false;
    }
  }

  qrGenerate(int index) {
    try {
      var json = (jsonEncode(credentials[index]));
      return json;
    } catch(err) {
      print(err);
      return "";
    }
  }
}
