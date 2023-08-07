import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppShows {
  static void showIndicator() {
    Get.defaultDialog(content: const CupertinoActivityIndicator());
  }

  static Future<void> showDialog(String title, String cancel) async {
    await Get.defaultDialog(title: title, cancel: Text(cancel));
  }

  static Future<void> showSnacKbar(
    String massage,
  ) async {
    Get.showSnackbar(const GetSnackBar(
      message: "Форманы туура эмес толтурдуңуз",
    ));
  }
}
