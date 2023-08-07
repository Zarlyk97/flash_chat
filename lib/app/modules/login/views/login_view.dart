import 'package:flash_chat1/app/components/animation_logo.dart';
import 'package:flash_chat1/app/components/custom_button.dart';
import 'package:flash_chat1/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AnimationLogo(
              size: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: controller.formkey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller.email,
                    hintText: "Enter your Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: controller.password,
                    hintText: "Enter your Password",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: isLogin ? "Login" : "Register",
              color: AppColors.white,
              onPressed: () async => await controller.registerLogin(isLogin),
              borderRadius: 30,
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
  });
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: "Enter your Email"),
      ),
    );
  }
}
