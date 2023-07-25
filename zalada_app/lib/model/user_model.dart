class UserModel {
  final int id;
  final String name;
  final String userimage;
  final String phone_number;
  final String gender;
  final String fcm;
  final DateTime dateofbrith;
  final DateTime creationdate;
  final DateTime updateddate;

  UserModel({
    required this.id,
    required this.name,
    required this.phone_number,
    required this.userimage,
    required this.fcm,
    required this.gender,
    required this.dateofbrith,
    required this.creationdate,
    required this.updateddate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'number': phone_number,
        'userimage': userimage,
        'gender': gender,
        'fcm': fcm,
        'dateofbrith': dateofbrith,
        'creationdate': creationdate,
        'updateddate': updateddate
      };

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        phone_number: json['number'],
        creationdate: json['creationdate'],
        dateofbrith: json['dateofbrith'],
        gender: json['gender'],
        fcm: json['fcm'],
        updateddate: json['updateddate'],
        userimage: json['userimage']);
  }
}
