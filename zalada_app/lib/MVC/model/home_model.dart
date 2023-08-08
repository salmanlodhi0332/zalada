import 'package:zalada_app/MVC/model/categories_model.dart';
import 'package:zalada_app/MVC/model/product_model.dart';

class Home_Model {
  final List<Product_Model>? hot_deals;
  final List<Product_Model>? trending_products;
  final List<Product_Model>? all_products;
  final List<categories_Model>? categories;

  Home_Model(
      {this.all_products,
      this.categories,
      this.hot_deals,
      this.trending_products});

  Map<String, dynamic> tojson() => {
        'hot_deals': hot_deals,
        'trending_products': trending_products,
        'all_products': all_products,
        'categories': categories
      };

  factory Home_Model.fromjson(Map<String, dynamic> json) {
    return Home_Model(
      hot_deals: json['hot_deals'] == null ? [] : json['hot_deals'].toList(),
      all_products:
          json['all_products'] == null ? [] : json['all_products'].toList(),
      trending_products: json['trending_products'] == null
          ? []
          : json['trending_products'].toList(),
      categories: json['categories'] == null ? [] : json['categories'].toList(),
    );
  }
}
