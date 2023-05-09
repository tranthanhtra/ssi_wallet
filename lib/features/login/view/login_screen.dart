import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/colors.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/custom_input_field.dart';
import 'package:ssi_wallet/components/text_style.dart';
import 'package:ssi_wallet/features/home/view/home_screen.dart';
import 'package:ssi_wallet/features/import_wallet/view/import_screen.dart';
import 'package:ssi_wallet/features/login/controller/login_controller.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/config.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginScreen,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "SSI Wallet",
            style: KTextStyle.appName,
          ),
          SizedBox(
            height: getHeight(150),
            child: Padding(
              padding: EdgeInsets.only(
                left: getWidth(50),
                right: getWidth(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomInputField(
                    hintText: "Password",
                    controller: loginController.passwordController,
                    labelText: "",
                  ),
                  SizedBox(
                    width: getWidth(150),
                    child: CustomButton(
                      text: "Create password",
                      textStyle: TextStyle(
                        color: AppColors.loginScreen,
                        fontSize: 15,
                      ),
                      onClick: () async {
                        // var result = await loginController.login();
                        await loginController.createPassword();

                        if (loginController.hasAccount) {
                          Get.put(GlobalController()).getAccount();
                          Get.to(HomeScreen());
                        } else {
                          Get.to(ImportScreen());
                        }
                      },
                      backgroundColor: Colors.white,
                      borderColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   height: getHeight(150),
      //   child: Padding(
      //     padding: EdgeInsets.only(
      //       left: getWidth(50),
      //       right: getWidth(50),
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         CustomInputField(
      //           hintText: "Password",
      //           controller: loginController.passwordController,
      //           labelText: "",
      //         ),
      //         SizedBox(
      //           width: getWidth(150),
      //           child: CustomButton(
      //             text: "Create password",
      //             textStyle: TextStyle(
      //               color: AppColors.loginScreen,
      //               fontSize: 15,
      //             ),
      //             onClick: () async {
      //               // var result = await loginController.login();
      //               loginController.createPassword();
      //
      //               if (loginController.hasAccount) {
      //                 Get.put(GlobalController()).getAccount();
      //                 Get.to(HomeScreen());
      //               } else {
      //                 Get.to(ImportScreen());
      //               }
      //             },
      //             backgroundColor: Colors.white,
      //             borderColor: Colors.white,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
