import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';
import '../_models/push_notification.dart';
import 'notification_service.dart';

DateTime? backPressTime;

class BackgroundFunction {
  BackgroundFunction._();

  static clearSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    getFCMToken();
  }

  static getFCMToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? currentToken = pref.getString('user_token');
    debugPrint(currentToken ?? 'xx');
    if (currentToken == null) {
      String? token;
      if (Platform.isIOS) {
        // On iOS we need to see an APN token is available first
        String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken != null) {
          token = await FirebaseMessaging.instance.getToken();
        } else {
          // add a delay and retry getting APN token
          await Future<void>.delayed(
            const Duration(
              seconds: 2,
            ),
          );
          apnsToken = await FirebaseMessaging.instance.getAPNSToken();
          if (apnsToken != null) {
            token = await FirebaseMessaging.instance.getToken();
          }
        }
      } else {
        token = await FirebaseMessaging.instance.getToken();
      }

      debugPrint(token ?? 'aa');

      if (token == null) {
        return;
      }
      debugPrint(token);
      pref.setString('user_token', token);
      pref.reload();
    }
  }

  @pragma('vm:entry-point')
  static Future<void> backgroundNotificationHandler(RemoteMessage message) async {
    await BackgroundFunction.initializeFirebaseIfNeeded();
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('user_token') == null) {
      return;
    }
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      debugPrint('Background notification received');

      PushNotification pushNotification = PushNotification(
        title: notification.title ?? 'Hukum Cepat',
        body: notification.body ?? 'Anda telah menerima pesan baru',
        data: message.data,
      );
      await NotificationService().showNotifications(pushNotification);
    }
    return;
  }

  static Future<void> initializeFirebaseIfNeeded() async {
    if (Firebase.apps.isEmpty) {
      debugPrint('Initializing Firebase...');
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } else {
      debugPrint('Firebase already initialized');
    }
  }

  static bool onWillPop() {
    DateTime now = DateTime.now();

    if (backPressTime == null || now.difference(backPressTime!) > const Duration(seconds: 3)) {
      backPressTime = now;
      Fluttertoast.showToast(msg: 'Tap dua kali untuk keluar.', toastLength: Toast.LENGTH_LONG);
      return false;
    }
    return true;
  }
}
