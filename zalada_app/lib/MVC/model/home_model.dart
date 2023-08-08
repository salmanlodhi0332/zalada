import 'package:zalada_app/MVC/model/categories_model.dart';
import 'package:zalada_app/MVC/model/product_model.dart';

class Home_Model {
  final List<Product_Model>? hotdeals;
  // final List<Product_Model>? trending_products;
  final List<Product_Model>? allproducts;
  final List<categories_Model>? categories;

  Home_Model({
    this.allproducts,
    this.categories,
    this.hotdeals,
    // this.trending_products
  });

  Map<String, dynamic> tojson() => {
        'hotdeals': hotdeals,
        // 'trending_products': trending_products,
        'allproducts': allproducts,
        'categories': categories
      };

  factory Home_Model.fromjson(Map<String, dynamic> json) {
    return Home_Model(
      hotdeals: json['hotdeals'] == null ? [] : json['hotdeals'].toList(),
      allproducts:
          json['allproducts'] == null ? [] : json['allproducts'].toList(),
      // trending_products: json['trending_products'] == null
      //     ? []
      //     : json['trending_products'].toList(),
      categories: json['categories'] == null ? [] : json['categories'].toList(),
    );
  }
}
