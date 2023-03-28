import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/constants.dart';

class LoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  bool hasAccount = false;
  GlobalController globalController = Get.put(GlobalController());

  login() async {
    if (globalController.db.read(Const.passwordKey) == null) {
      globalController.db.write(Const.passwordKey, 'Tratran0501');
    }

    if (passwordController.text == globalController.db.read(Const.passwordKey)) {
      hasAccount = globalController.db.read(Const.addressKey) != null;
      return true;
    }

    return false;
  }
}