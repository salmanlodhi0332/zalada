class Wishlist_model {
  final int wishlistId;
  final int productId;
  final String productName;
  final String productDescription;
  final int productCategoryId;
  final String productModel;
  final String productMake;
  final String productPrice;
  final List images;

  Wishlist_model({
    required this.wishlistId,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productCategoryId,
    required this.productModel,
    required this.productMake,
    required this.productPrice,
    required this.images,
  });
  Map<String, dynamic> tojson() => {
        'wishlist_id': wishlistId,
        'product_id': productId,
        'product_name': productName,
        'product_description': productDescription,
        'product_category_id': productCategoryId,
        'product_model': productModel,
        'product_make': productMake,
        'product_price': productPrice,
        'images': images,
      };
  factory Wishlist_model.fromJson(Map<String, dynamic> json) {
    return Wishlist_model(
      wishlistId: json["wishlistId"],
      productId: json["productId"],
      productName: json["productName"],
      productDescription: json["productDescription"],
      productCategoryId: json["productCategoryId"],
      productModel: json["productModel"],
      productMake: json["productMake"],
      productPrice: json["productPrice"],
      images: json['images'] == null
          ? [
              'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
            ]
          : json['images'].toList(),
    );
  }
}
