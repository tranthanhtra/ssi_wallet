import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/custom_input_field.dart';
import 'package:ssi_wallet/features/home/view/home_screen.dart';
import 'package:ssi_wallet/features/import_wallet/view/import_screen.dart';
import 'package:ssi_wallet/features/login/controller/login_controller.dart';
import 'package:ssi_wallet/utils/config.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Text("SSI Wallet"),
      ),
      bottomNavigationBar: SizedBox(
        height: getHeight(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomInputField(
              hintText: "",
              controller: loginController.passwordController,
              labelText: "Password",
            ),
            CustomButton(
              text: "Login",
              onClick: () async {
                var result = await loginController.login();

                if (result) {
                  Get.to(loginController.hasAccount ? HomeScreen() : ImportScreen());
                }else {
                  print("wrong pw");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
