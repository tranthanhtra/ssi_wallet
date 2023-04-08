import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ssi_wallet/components/custom_dialog.dart';
import 'package:ssi_wallet/features/account/controller/account_controller.dart';
import 'package:ssi_wallet/global_controller.dart';

import '../../../components/custom_button.dart';
import '../../../components/text_style.dart';
import '../../../utils/config.dart';
import '../../../utils/constants.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  GlobalController globalController = Get.put(GlobalController());
  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Account",
            style: KTextStyle.bigTile,
          ),
          SizedBox(
            height: getHeight(100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Address",
                style: KTextStyle.label,
              ),
              SizedBox(
                height: getHeight(50),
                width: getWidth(100),
                child: CustomButton(
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  text: "",
                  onClick: () async {
                    await Clipboard.setData(ClipboardData(
                      text: globalController.address,
                    ));
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copy,
                        size: 25,
                      ),
                      Text(
                        "Copy",
                        style: KTextStyle.smallButton,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Text(
            globalController.address.replaceRange(7, 37, "..."),
            style: KTextStyle.address,
          ),
          SizedBox(
            height: getHeight(50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DID",
                style: KTextStyle.label,
              ),
              SizedBox(
                height: getHeight(50),
                width: getWidth(110),
                child: Obx(() {
                  return globalController.did.value == ""
                      ? CustomButton(
                          backgroundColor: Colors.white,
                          borderColor: Colors.white,
                          text: "",
                          onClick: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialog(
                                    title: "Import DID",
                                    description: "Copy your DID here",
                                    inputField: true,
                                    textEditingController:
                                        accountController.didString,
                                    onContinue: () async {
                                      await globalController.db.write(
                                          Const.didKey,
                                          accountController.didString.text);
                                      globalController.getAccount();
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  );
                                });
                          },
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download,
                                size: 25,
                              ),
                              Text(
                                "Import",
                                style: KTextStyle.smallButton,
                              ),
                            ],
                          ),
                        )
                      : CustomButton(
                          backgroundColor: Colors.white,
                          borderColor: Colors.white,
                          text: "",
                          onClick: () async {
                            await Clipboard.setData(ClipboardData(
                                text: globalController.did.value));
                          },
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.copy,
                                size: 25,
                              ),
                              Text(
                                "Copy",
                                style: KTextStyle.smallButton,
                              ),
                            ],
                          ),
                        );
                }),
              ),
            ],
          ),
          Obx(() {
            return Text(
              globalController.did.value == ""
                  ? ""
                  : globalController.did.value.replaceRange(7, 37, "..."),
              style: KTextStyle.address,
            );
          }),
          SizedBox(
            height: getHeight(100),
          ),
        ],
      ),
    );
  }
}
