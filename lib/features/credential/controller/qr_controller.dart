import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrController extends GetxController {
  late String json;
  late QrImage qrImage;

  qrGenerate(String data) {
    try {
      json = data;
      print(json);
      qrImage = QrImage(
        data: json,
        version: QrVersions.auto,
        size: 300,
      );
      return true;
    } catch(err) {
      print(err);
      return false;
    }
  }
}