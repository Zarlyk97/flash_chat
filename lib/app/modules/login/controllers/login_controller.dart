import 'package:flash_chat1/app/modules/login/services/login_register_service.dart';
import 'package:flash_chat1/app/routes/app_pages.dart';
import 'package:flash_chat1/utils/app_shows.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> registerLogin(bool isLogin) async {
    if (formkey.currentState!.validate() &&
        GetUtils.isEmail(email.text) &&
        GetUtils.isPassport(password.text)) {
      AppShows.showIndicator();
      final user = isLogin
          ? await LoginserVice.login(email.text, password.text)
          : await LoginserVice.register(email.text, password.text);
      Get.back();
      if (user != null) {
        await Get.offAllNamed(Routes.HOME);
      } else {
        AppShows.showDialog(
            isLogin ? "Сиз логин паролду туура эмес жаздыңыз!" : "Ката бар",
            'kata bar');
      }
    } else {
      AppShows.showSnacKbar("Форманы туура эмес толтурдуңуз");
    }
  }
}
