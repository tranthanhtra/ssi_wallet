import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/colors.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/signature.dart';
import 'package:ssi_wallet/components/text_style.dart';
import 'package:ssi_wallet/features/credential/controller/credential_controller.dart';
import 'package:ssi_wallet/features/credential/controller/qr_controller.dart';
import 'package:ssi_wallet/features/credential/view/qr_screen.dart';
import 'package:ssi_wallet/utils/config.dart';

import '../../../components/custom_dialog.dart';

class CredentialComponent extends StatelessWidget {
  CredentialComponent(
      {Key? key,
      required this.credentialName,
      required this.issuer,
      required this.credentialType,
      required this.issueDate,
      required this.index})
      : super(key: key);

  final String credentialName;
  final String issuer;
  final String credentialType;
  final String issueDate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: getHeight(200),
        color: AppColors.card,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(credentialName),
              Text(issuer),
              Text(credentialType),
              Text(issueDate),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: "",
                    onClick: () {
                      var string =
                      Get.put(CredentialController()).createPresentation(index);
                      if (string != "") {
                        var result = Get.put(QrController()).qrGenerate(string);
                        if (result) Get.to(QrScreen());
                      }
                    },
                    icon: Column(
                      children: [
                        Icon(
                          Icons.folder_shared,
                          size: 25,
                        ),
                        Text(
                          "VP",
                          style: KTextStyle.tinyButton,
                        ),
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                  ),
                  CustomButton(
                    text: "",
                    onClick: () {
                      var string =
                          Get.put(CredentialController()).qrGenerate(index);
                      if (string != "") {
                        var result = Get.put(QrController()).qrGenerate(string);
                        if (result) Get.to(QrScreen());
                      }
                    },
                    icon: Icon(
                      Icons.qr_code,
                      size: 40,
                    ),
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                  ),
                  CustomButton(
                    text: "",
                    onClick: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              title: "Delete Credential",
                              description:
                                  "Do you want to delete credential $credentialName ?",
                              inputField: false,
                              onContinue: () async {
                                var result =
                                    await Get.put(CredentialController())
                                        .deleteCredential(index);
                                if (result) {
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                }
                              },
                            );
                          });
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 40,
                    ),
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
