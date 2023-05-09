import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/constants.dart';
import 'package:web3dart/web3dart.dart';

class ImportController extends GetxController {
  TextEditingController privateKey = TextEditingController();
  GlobalController globalController = Get.put(GlobalController());

  import() async {
    try {
      var credentials = EthPrivateKey.fromHex("0x${privateKey.text}");
      var address = await credentials.address;

// You can now call rpc methods. This one will query the amount of Ether you own

      globalController.db.write(Const.privateKey, privateKey.text);
      globalController.db.write(Const.addressKey, address.toString());
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}