import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/components/custom_button.dart';
import 'package:ssi_wallet/components/custom_input_field.dart';
import 'package:ssi_wallet/features/home/view/home_screen.dart';
import 'package:ssi_wallet/features/import_wallet/controller/import_controller.dart';
import 'package:ssi_wallet/utils/config.dart';

class ImportScreen extends StatelessWidget {
  ImportController importController = Get.put(ImportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: getHeight(150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomInputField(
                hintText: "",
                controller: importController.privateKey,
                labelText: "Private key",
              ),
              CustomButton(
                text: "Import",
                onClick: () async {
                  var result = await importController.import();
                  if (result) {
                    Get.to(HomeScreen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
