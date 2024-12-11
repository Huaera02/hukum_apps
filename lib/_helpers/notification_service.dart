import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_models/push_notification.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel_25', // id
    'HukumCepat', // title
    description: 'HukumCepat.',
    playSound: true,
// description
    importance: Importance.high,
  );

  final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late final SharedPreferences pref;

  Future<void> init() async {
    await Permission.photos.isDenied.then((bool value) {
      if (value) {
        Permission.photos.request();
      }
    });
    await Permission.notification.isDenied.then((bool value) {
      if (value) {
        Permission.notification.request();
      }
    });
    _configureSelectNotificationSubject();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsDarwin = const DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: null,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        if (notificationResponse.notificationResponseType == NotificationResponseType.selectedNotification) {
          selectNotificationSubject.add(notificationResponse.payload);
        }
      },
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    pref = await SharedPreferences.getInstance();

    initFirebaseListeners();
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      if (pref.getString('user_token') == null) {
        return;
      }
      if (payload == null) {
        return;
      }
      //PushNotification entity = PushNotification.fromRawJson(payload);
      // setRedirectionFromForeground
    });
  }

  Future<dynamic>? onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    if (pref.getString('user_token') == null) {
      return null;
    }
    if (payload == null) {
      return null;
    }
    // PushNotification? entity = PushNotification.fromRawJson(payload);
    //  setRedirectionFromForeground
    return null;
  }

  Future<void> initFirebaseListeners() async {
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //ketika notifikasi dibuka dari background (app ditutup)
      if (pref.getString('user_token') == null) {
        return;
      }
      dynamic data = message.data;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (pref.getString('user_token') == null) {
        return;
      }
      if (message.notification == null) {
        return;
      }
      PushNotification pushNotification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        data: message.data,
      );

      pushNotification.title = pushNotification.title ?? 'Pasar Saumata';
      pushNotification.body = pushNotification.body ?? 'Anda telah menerima pesan baru';
      showNotifications(pushNotification);
    });
  }

  Future<dynamic>? onSelectNotification(NotificationResponse notificationResponse) {
    //ketika notifikasi dibuka dari foreground (app dibuka)
    try {
      if (pref.getString('user_token') == null) {
        return null;
      }
      dynamic data = jsonDecode(notificationResponse.payload!);
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> showNotifications(PushNotification pushNotification) async {
    Random random = Random();
    int id = random.nextInt(900) + 10;
    await flutterLocalNotificationsPlugin.show(
      id,
      pushNotification.title,
      pushNotification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: '@mipmap/ic_launcher',
          channelShowBadge: true,
          playSound: true,
          enableVibration: true,
          sound: channel.sound,
          priority: Priority.high,
          importance: Importance.high,
          styleInformation: BigTextStyleInformation(pushNotification.body!),
        ),
        iOS: const DarwinNotificationDetails(
          presentBadge: true,
          presentSound: true,
          presentAlert: true,
        ),
      ),
      payload: jsonEncode(pushNotification.data),
    );
  }
}
