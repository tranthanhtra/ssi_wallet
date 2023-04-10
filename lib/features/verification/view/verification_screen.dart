import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/custom_input_field.dart';
import 'package:ssi_wallet/features/verification/controller/verification_controller.dart';

import '../../../components/custom_dialog.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  VerificationController verificationController =
      Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInputField(
            hintText: "",
            controller: verificationController.credentialJson,
            labelText: "Input the presentation",
          ),
          CustomButton(
            text: "Verify",
            onClick: () async {
              await verificationController.verifyPresentation();
            },
          ),
          Obx(() {
            var valid = verificationController.valid.value;
            return valid == 0
                ? SizedBox()
                : valid == 1
                    ? Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 60,
                      )
                    : Icon(
                        Icons.disabled_by_default,
                        color: Colors.red,
                        size: 60,
                      );
          })
        ],
      ),
    );
  }
}
