import 'package:get/get.dart';
import 'package:ssi_wallet/utils/constants.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class GlobalController extends GetxController {
  var apiUrl = "http://10.0.2.2:8545";
  late Web3Client ethClient;
  late GetStorage db;

  PageController pageController = PageController(initialPage: 0, keepPage: true);

  RxInt currentPage = 0.obs;

  @override
  onInit() async {
    var httpClient = Client();
    ethClient = Web3Client(apiUrl, httpClient);
    await GetStorage.init();
    db = GetStorage();
    // TODO: implement onInit
    super.onInit();
  }

  getBalance() async {
    EtherAmount balance = await ethClient.getBalance(
        db.read(Const.addressKey));
  }

  onChangeTab(int value) {
    try {
      currentPage.value = value;
      pageController.jumpToPage(value);
    } catch (e) {
      currentPage.value = value;
      pageController = PageController(initialPage: value, keepPage: true);
    }
  }
}