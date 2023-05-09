import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ssi_wallet/features/home/view/home_screen.dart';
import 'package:ssi_wallet/features/import_wallet/view/import_screen.dart';
import 'package:ssi_wallet/features/login/view/login_screen.dart';
import 'package:ssi_wallet/global_controller.dart';
import 'package:ssi_wallet/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supreme Reader',
      theme: ThemeData(),
      home: home(),
    );
  }

  Widget home() {
    return globalController.db.read(Const.passwordKey) != null
        ? (globalController.db.read(Const.addressKey) != null
            ? HomeScreen()
            : ImportScreen())
        : LoginScreen();
  }
}
