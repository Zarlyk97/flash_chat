// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat1/constants/app_colors.dart';
import 'package:flash_chat1/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 80,
                height: 80,
              ),
              const FlashChatText()
            ],
          ),
          const CustomButton(
            text: 'Login',
            color: AppColors.white,
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomButton(
            text: 'Register',
            color: AppColors.blued,
          ),
        ],
      )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(MediaQuery.of(context).size.width - 30, 60),
          elevation: 10,
          shadowColor: AppColors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {},
      child: Text(
        text,
        style: AppTextStyle.logReg,
      ),
    );
  }
}

class FlashChatText extends StatelessWidget {
  const FlashChatText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyle.flashchat,
      child: AnimatedTextKit(
        totalRepeatCount: 2000,
        animatedTexts: [
          WavyAnimatedText('Flash chat'),
          // WavyAnimatedText('Look at the waves'),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
}
