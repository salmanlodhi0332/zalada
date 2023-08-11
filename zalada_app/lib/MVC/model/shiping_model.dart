class Shiping_Model {
  final int? id;
  final String name;
  final String image;
  final String charges;
  final String estimated_time;

  final String type;
  final String? createdAt;
  final String? updatedAt;

  Shiping_Model({
    this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.charges,
    required this.estimated_time,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'type': type,
        'image': image,
        'charges': charges,
        'estimated_time': estimated_time,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };

  factory Shiping_Model.fromJson(Map<String, dynamic> json) {
    return Shiping_Model(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        image: json['image'],
        charges: json['charges'].toString(),
        estimated_time: json['estimated_time'].toString(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
