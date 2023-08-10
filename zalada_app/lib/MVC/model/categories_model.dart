import 'package:zalada_app/MVC/model/product_model.dart';

class categories_Model {
  final int id;
  final String name;
  final String Categoriesimage;
  final List<Product_Model>? products;
  final String creationdate;
  final String updateddate;

  categories_Model({
    required this.id,
    required this.name,
    required this.Categoriesimage,
    this.products,
    required this.creationdate,
    required this.updateddate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'products': products,
        'image': Categoriesimage,
        'createdAt': creationdate,
        'updatedAt': updateddate
      };

  factory categories_Model.fromjson(Map<String, dynamic> json) {
    return categories_Model(
      id: json['category_id'],
      name: json['name'],
      Categoriesimage: json['category_image'],
      products: json['products'] == null ? [] : json['products'].toList(),
      updateddate: json['createdAt'],
      creationdate: json['updatedAt'],
    );
  }
}
