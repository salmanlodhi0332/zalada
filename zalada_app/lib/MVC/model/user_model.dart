class UserModel {
  final int? id;
  final String name;
  final String email;
  final String password;
  late final String userimage;
  final String phone_number;
  final String gender;
  final String fcm;
  final String dateofbrith;
  final String? creationdate;
  final String? updateddate;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone_number,
    required this.userimage,
    required this.fcm,
    required this.gender,
    required this.dateofbrith,
     this.creationdate,
     this.updateddate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        "email": email,
        "password": password,
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
        email: json["email"],
        password: json['password'],
        phone_number: json['number'],
        creationdate: json['creationdate'],
        dateofbrith: json['dateofbrith'],
        gender: json['gender'],
        fcm: json['fcm'],
        updateddate: json['updateddate'],
        userimage: json['userimage']);
  }
}
