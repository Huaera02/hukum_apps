import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(() => const LoginView());
     });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 228,
            width: 204,
          ),
        ));
  }
}