class Product_Model {
  final int id;
  final String name;
  final String description;
  final int category_id;
  final String model;
  final String make;
  final String price;
  final List images;
  final List colors;
  final List memory;
  final List storage;
  final int createdBy;
  final DateTime creationdate;
  final DateTime updateddate;

  Product_Model({
    required this.id,
    required this.name,
    required this.description,
    required this.category_id,
    required this.make,
    required this.model,
    required this.price,
    required this.images,
    required this.colors,
    required this.memory,
    required this.storage,
    required this.createdBy,
    required this.creationdate,
    required this.updateddate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'description': description,
        'category_id': category_id,
        'make': make,
        'model': model,
        'price': price,
        'images': images,
        'colors': colors,
        'memory': memory,
        'storage':storage,
        'createdBy': createdBy,
        'creationdate': creationdate,
        'updateddate': updateddate
      };

  factory Product_Model.fromjson(Map<String, dynamic> json) {
    return Product_Model(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        category_id: json['category_id'],
        make: json['make'],
        model: json['model'],
        price: json['price'],
        images: json['images'] == null ? [] : json['images'].toList(),
        colors: json['colors'] == null ? [] : json['colors'].toList(),
        memory: json['memory'] == null
            ? []
            : json['memory'].toList(),
        storage: json['storage']  == null
            ? []
            : json['storage'].toList(),   
        updateddate: json['updateddate'],
        creationdate: json['creationdate'],
        createdBy: json['createdBy']);
  }
}
