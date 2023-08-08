class Product_Model {
  final int id;
  final String name;
  final String description;
  final int category_id;
  final String price;
  final String? discountedPrice;
  final List product_media;
  final List<List> subsections;
  final String createdAt;
  final String updatedAt;
  final String? isNewArrival;
  final String? outOfStock;

  Product_Model({
    required this.id,
    this.isNewArrival,
    this.outOfStock,
    this.discountedPrice,
    required this.name,
    required this.description,
    required this.category_id,
    required this.price,
    required this.product_media,
    required this.subsections,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> tojson() => {
        'product_id': id,
        'isNewArrival': isNewArrival,
        'outOfStock': outOfStock,
        'discountedPrice': discountedPrice,
        'product_name': name,
        'product_description': description,
        'category_id': category_id,
        'price': price,
        'product_media': product_media,
        'subsections': subsections,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };

  factory Product_Model.fromjson(Map<String, dynamic> json) {
    return Product_Model(
      id: json['product_id'],
      discountedPrice:
          json['discountedPrice'] == null ? json['discountedPrice'] : '',
      isNewArrival: json['isNewArrival'].toString(),
      outOfStock: json['outOfStock'].toString(),
      name: json['product_name'],
      description: json['product_description'],
      category_id: json['category_id'],
      price: json['price'].toString(),
      product_media: json['product_media'] == null
          ? [
              // 'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
            ]
          : json['product_media'].toList(),
      subsections:
          json['subsections'] == null ? [] : json['subsections'].toList(),
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }
}

//   static List<Product_Model> dummyProducts = [
//     Product_Model(
//       id: 1,
//       name: "Sample Product 1",
//       description: "This is a sample product description. 1",
//       category_id: 123,
//       make: "Sample Make 1",
//       model: "Sample Model 1",
//       price: "78.99",
//       images: [
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
//       ],
//       // colors: [
//       //   "Red",
//       //   "Blue",
//       //   "Green",
//       // ],
//       memory: [
//         "16GB",
//         "32GB",
//         "64GB",
//       ],
//       storage: [
//         "16GB SSD Storage",
//         "32GB SSD Storage",
//         "64GB SSD Storage",
//       ],
//       createdBy: 456,
//       creationdate: DateTime.now(),
//       updateddate: DateTime.now(),
//     ),
//     Product_Model(
//       id: 2,
//       name: "Sample Product 2",
//       description: "This is a sample product description. 2",
//       category_id: 163,
//       make: "Sample Make 2",
//       model: "Sample Model 2",
//       price: "123.99",
//       images: [
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
//       ],
//       // colors: [
//       //   "Red",
//       //   "Blue",
//       //   "Green",
//       // ],
//       memory: [
//         "16GB",
//         "32GB",
//         "64GB",
//       ],
//       storage: [
//         "16GB SSD Storage",
//         "32GB SSD Storage",
//         "64GB SSD Storage",
//       ],
//       createdBy: 456,
//       creationdate: DateTime.now(),
//       updateddate: DateTime.now(),
//     ),
//     Product_Model(
//       id: 3,
//       name: "Sample Product 3",
//       description: "This is another sample product description. 3",
//       category_id: 456,
//       make: "Sample Make 3",
//       model: "Sample Model 3",
//       price: "149.99",
//       images: [
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p2.png?alt=media&token=56fdf9f3-796b-47c4-a0d6-0616ae5d5635",
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
//       ],
//       // colors: [
//       //   "Black",
//       //   "Silver",
//       // ],
//       memory: [
//         "128GB",
//         "256GB",
//       ],
//       storage: [
//         "16GB SSD Storage",
//         "32GB SSD Storage",
//         "64GB SSD Storage",
//       ],
//       createdBy: 789,
//       creationdate: DateTime.now(),
//       updateddate: DateTime.now(),
//     ),
//     Product_Model(
//       id: 4,
//       name: "Sample Product 4",
//       description: "This is a sample product description. 4",
//       category_id: 125,
//       make: "Sample Make 4",
//       model: "Sample Model 4",
//       price: "784.99",
//       images: [
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p1.png?alt=media&token=c077254f-d397-42c5-aaf8-fe0b8a449fc8",
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p2.png?alt=media&token=56fdf9f3-796b-47c4-a0d6-0616ae5d5635",
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
//       ],
//       // colors: [
//       //   "Red",
//       //   "Blue",
//       //   "Green",
//       // ],
//       memory: [
//         "16GB",
//         "32GB",
//         "64GB",
//       ],
//       storage: [
//         "16GB SSD Storage",
//         "32GB SSD Storage",
//         "64GB SSD Storage",
//       ],
//       createdBy: 456,
//       creationdate: DateTime.now(),
//       updateddate: DateTime.now(),
//     ),
//     Product_Model(
//       id: 5,
//       name: "Sample Product 5",
//       description: "This is a sample product description. 5",
//       category_id: 123,
//       make: "Sample Make 5",
//       model: "Sample Model 5",
//       price: "502.99",
//       images: [
//         "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p6.png?alt=media&token=ed7cd206-d1f6-4f40-b86d-e79730c16c14",
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
//         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
//       ],
//       // colors: [
//       //   "Red",
//       //   "Blue",
//       //   "Green",
//       // ],
//       memory: [
//         "16GB",
//         "32GB",
//         "64GB",
//       ],
//       storage: [
//         "16GB SSD Storage",
//         "32GB SSD Storage",
//         "64GB SSD Storage",
//       ],
//       createdBy: 456,
//       creationdate: DateTime.now(),
//       updateddate: DateTime.now(),
//     )
//   ];
// }
