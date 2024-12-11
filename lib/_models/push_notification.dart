import 'dart:convert';

class PushNotification {
  PushNotification({
    required this.title,
    required this.body,
    required this.data,
  });
  String? title;
  String? body;
  Map<String, dynamic>? data;

  factory PushNotification.fromRawJson(String str) => PushNotification.fromJson(jsonDecode(str));

  String toRawJson() => jsonEncode(toJson());

  factory PushNotification.fromJson(Map<String, dynamic> json) => PushNotification(
        title: json['title'],
        body: json['body'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'body': body,
        'data': data,
      };
}
