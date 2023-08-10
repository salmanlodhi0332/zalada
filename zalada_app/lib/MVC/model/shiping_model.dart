class Shiping_Model {
  final int? id;
  final String name;
  final String image;
  final String charges;
  final String estimated_time;

  final String? createdAt;
  final String? updatedAt;

  Shiping_Model({
    this.id,
    required this.name,
    required this.image,
    required this.charges,
    required this.estimated_time,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
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
        image: json['image'],
        charges: json['charges'].toString(),
        estimated_time: json['estimated_time'].toString(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
