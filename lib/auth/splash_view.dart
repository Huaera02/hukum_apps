import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginn/menu/bottomnav.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/auth/login_view.dart';
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
            'assets/images/logo_hc.png',
            height: 250,
            width: 250,
          ),
        ));
  }
}
