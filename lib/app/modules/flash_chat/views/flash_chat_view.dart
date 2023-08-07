import 'package:flash_chat1/app/components/animation_logo.dart';
import 'package:flash_chat1/app/components/custom_button.dart';
import 'package:flash_chat1/app/routes/app_pages.dart';
import 'package:flash_chat1/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/flash_chat_text.dart';
import '../controllers/flash_chat_controller.dart';

class FlashChatView extends GetView<FlashChatController> {
  const FlashChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffAFAFAF),
        title: const Text('FlashChatView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimationLogo(),
              FlashChatText(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Login',
            color: AppColors.white,
            onPressed: () => Get.toNamed(Routes.LOGIN, arguments: true),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Register',
            color: AppColors.blued,
            onPressed: () => Get.toNamed(Routes.LOGIN, arguments: false),
          ),
        ],
      )),
    );
  }
}
