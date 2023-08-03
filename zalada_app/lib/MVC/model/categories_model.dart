class categories_Model {
  final int id;
  final String name;
  final String Categoriesimage;
  final String creationdate;
  final String updateddate;

  categories_Model({
    required this.id,
    required this.name,
    required this.Categoriesimage,
    required this.creationdate,
    required this.updateddate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'image': Categoriesimage,
        'createdAt': creationdate,
        'updatedAt': updateddate
      };

  factory categories_Model.fromjson(Map<String, dynamic> json) {
    return categories_Model(
      id: json['id'],
      name: json['name'],
      Categoriesimage: json['image'],
      updateddate: json['createdAt'],
      creationdate: json['updatedAt'],
    );
  }
}

