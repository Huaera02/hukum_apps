import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginn/bottomnav.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getBool('is_logged_in') ?? false) {
        //klo sudah login
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavView(),
        ));
      } else {
        //belum login
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginView(),
        ));
      }
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
