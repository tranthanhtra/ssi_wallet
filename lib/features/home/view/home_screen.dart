import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/text_style.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/config.dart';
import 'package:ssi_wallet/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Center(
        child: SizedBox(
          height: getHeight(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${0} ETH",
                style: KTextStyle.balance,
              ),
              Text(globalController.db.read(Const.addressKey)),
            ],
          ),
        ),
      ),
    );
  }
}
