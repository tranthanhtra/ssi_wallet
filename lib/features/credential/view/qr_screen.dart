import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/app_bar.dart';
import 'package:ssi_wallet/components/colors.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/text_style.dart';
import 'package:ssi_wallet/features/credential/controller/qr_controller.dart';
import 'package:ssi_wallet/utils/config.dart';

class QrScreen extends StatelessWidget {
  QrScreen({Key? key}) : super(key: key);
  QrController qrController = Get.put(QrController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black.withOpacity(0),
        elevation: 0,
      ),
      backgroundColor: AppColors.card,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getHeight(400),
              width: getWidth(400),
              color: Colors.white,
              child: qrController.qrImage,
            ),
            SizedBox(
              height: getHeight(100),
            ),
            SizedBox(
              height: getHeight(50),
              width: getWidth(150),
              child: CustomButton(
                backgroundColor: Colors.white,
                borderColor: Colors.white,
                text: "",
                onClick: () async {
                  await Clipboard.setData(
                      ClipboardData(text: qrController.json));

                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy,
                      size: 30,
                    ),
                    Text(
                      "Copy",
                      style: KTextStyle.smallButton,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
