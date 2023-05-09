import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/signature.dart';

class AccountController extends GetxController {
  TextEditingController didString = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    globalController.getAccount();
    super.onInit();
  }
}