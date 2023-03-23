import 'package:flutter/material.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/utils/config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SSI Wallet"),
      ),
      bottomNavigationBar: SizedBox(
        height: getHeight(100),
        child: Column(
          children: [
            CustomButton(
              text: "Login",
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
