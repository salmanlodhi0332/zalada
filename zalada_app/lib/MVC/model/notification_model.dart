import 'package:intl/intl.dart';

class Notification_Model {
  final int? id;
  final String? title;
  final String? body;
  final String? createdAt;
  final String? updatedAt;
  final int? user_id;

  Notification_Model(
      {this.id,
      this.title,
      this.body,
      this.createdAt,
      this.updatedAt,
      this.user_id});

  Map<String, dynamic> tojson() => {
        'id': id,
        'title': title,
        'body': body,
        'user_id': user_id,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };

  factory Notification_Model.fromJson(Map<String, dynamic> json) {
    return Notification_Model(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      user_id: json['user_id'],
      createdAt:
          DateFormat('yyyy-MM-dd').format(DateTime.parse(json['createdAt'])),
      updatedAt: json['updatedAt'],
    );
  }
}
