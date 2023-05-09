import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/navigation_bar.dart';
import 'package:ssi_wallet/features/account/view/account_screen.dart';
import 'package:ssi_wallet/features/credential/view/cridentials_screen.dart';
import 'package:ssi_wallet/features/verification/view/verification_screen.dart';
import 'package:ssi_wallet/global_controller.dart';

class HomeScreen extends StatelessWidget {
  GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomNavigationBar(),
      body: PageView(
        controller: Get.put(GlobalController()).pageController,
        children: [
          AccountScreen(),
          CredentialsScreen(),
          VerificationScreen(),
        ],
      ),
    );  }
}
