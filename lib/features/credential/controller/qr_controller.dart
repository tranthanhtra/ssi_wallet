import 'dart:convert';

import 'package:archive/archive.dart';
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
        data: zip(data),
        version: QrVersions.auto,
        size: 400,
      );
      return true;
    } catch(err) {
      print(err);
      return false;
    }
  }

  zip(String data) {
    var myString = data;
    var stringBytes = utf8.encode(myString);
    var gzipBytes = GZipEncoder().encode(stringBytes);
    var compressedString = base64.encode(gzipBytes!);
    return(compressedString);
  }


}