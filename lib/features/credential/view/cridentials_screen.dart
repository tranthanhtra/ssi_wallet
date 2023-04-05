import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/custom_dialog.dart';
import 'package:ssi_wallet/features/credential/controller/credential_controller.dart';
import 'package:ssi_wallet/features/credential/view/credential_component.dart';
import 'package:ssi_wallet/utils/config.dart';

class CredentialsScreen extends StatelessWidget {
  CredentialsScreen({Key? key}) : super(key: key);

  CredentialController credentialController = Get.put(CredentialController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                height: getHeight(50),
                width: getWidth(50),
                child: CustomButton(
                  text: "",
                  onClick: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            title: "Import Credential",
                            description: "Paste your credential here",
                            inputField: true,
                            textEditingController:
                                credentialController.credentialInput,
                            onContinue: () async {
                              var result =
                                  await credentialController.importCredential();
                              if (result) {
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          );
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      Obx(() {
        var credentials = credentialController.credentials.value;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            credentials.length,
            (index) {
              var credential = jsonDecode(credentials[index].toString());
              return CredentialComponent(
                credentialName: credential["credentialSubject"]["degree"]["name"],
                issuer: credential["issuer"],
                credentialType: credential["type"][0],
                issueDate: credential["issuanceDate"],
                index: index,
              );
            },
          ),
        );
      }),
    ]);
  }
}
