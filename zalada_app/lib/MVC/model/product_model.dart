class Product_Model {
  final int id;
  final String name;
  final String description;
  final int category_id;
  final String model;
  final String make;
  final String price;
  final String? discountprice;
  final String? hotdeal;
  final List images;
  // final List colors;
  final String memory;
  final String storage;
  final int createdBy;
  final String creationdate;
  final String updateddate;

  Product_Model({
    required this.id,
    this.hotdeal,
    this.discountprice,
    required this.name,
    required this.description,
    required this.category_id,
    required this.make,
    required this.model,
    required this.price,
    required this.images,
    // required this.colors,
    required this.memory,
    required this.storage,
    required this.createdBy,
    required this.creationdate,
    required this.updateddate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'hotdeal': hotdeal,
        'discountprice': discountprice,
        'name': name,
        'description': description,
        'category_id': category_id,
        'make': make,
        'model': model,
        'price': price,
        'images': images,
        // 'colors': colors,
        'memory': memory,
        'storage': storage,
        'createdBy': createdBy,
        'creationdate': creationdate,
        'updateddate': updateddate
      };

  factory Product_Model.fromjson(Map<String, dynamic> json) {
    return Product_Model(
        id: json['id'],
        discountprice: json['discount'] == null ? json['discount'] : '',
        hotdeal: json['hot_deal'].toString(),
        name: json['name'],
        description: json['description'],
        category_id: json['category_id'],
        make: json['make'],
        model: json['model'],
        price: json['price'].toString(),
        images: json['images'] == null
            ? [
                'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
              ]
            : json['images'].toList(),
        // colors: json['colors'] == null ? [] : json['colors'].toList(),
        memory: json['memory'] == null ? '' : json['memory'].toString(),
        storage: json['storage'] == null ? '' : json['storage'].toString(),
        updateddate: json['updatedAt'],
        creationdate: json['createdAt'],
        createdBy: json['createdByUserId']);
  }

  // static List<Product_Model> dummyProducts = [
  //   Product_Model(
  //     id: 1,
  //     name: "Sample Product 1",
  //     description: "This is a sample product description. 1",
  //     category_id: 123,
  //     make: "Sample Make 1",
  //     model: "Sample Model 1",
  //     price: "78.99",
  //     images: [
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
  //     ],
  //     // colors: [
  //     //   "Red",
  //     //   "Blue",
  //     //   "Green",
  //     // ],
  //     memory: [
  //       "16GB",
  //       "32GB",
  //       "64GB",
  //     ],
  //     storage: [
  //       "16GB SSD Storage",
  //       "32GB SSD Storage",
  //       "64GB SSD Storage",
  //     ],
  //     createdBy: 456,
  //     creationdate: DateTime.now(),
  //     updateddate: DateTime.now(),
  //   ),
  //   Product_Model(
  //     id: 2,
  //     name: "Sample Product 2",
  //     description: "This is a sample product description. 2",
  //     category_id: 163,
  //     make: "Sample Make 2",
  //     model: "Sample Model 2",
  //     price: "123.99",
  //     images: [
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
  //     ],
  //     // colors: [
  //     //   "Red",
  //     //   "Blue",
  //     //   "Green",
  //     // ],
  //     memory: [
  //       "16GB",
  //       "32GB",
  //       "64GB",
  //     ],
  //     storage: [
  //       "16GB SSD Storage",
  //       "32GB SSD Storage",
  //       "64GB SSD Storage",
  //     ],
  //     createdBy: 456,
  //     creationdate: DateTime.now(),
  //     updateddate: DateTime.now(),
  //   ),
  //   Product_Model(
  //     id: 3,
  //     name: "Sample Product 3",
  //     description: "This is another sample product description. 3",
  //     category_id: 456,
  //     make: "Sample Make 3",
  //     model: "Sample Model 3",
  //     price: "149.99",
  //     images: [
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p2.png?alt=media&token=56fdf9f3-796b-47c4-a0d6-0616ae5d5635",
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
  //     ],
  //     // colors: [
  //     //   "Black",
  //     //   "Silver",
  //     // ],
  //     memory: [
  //       "128GB",
  //       "256GB",
  //     ],
  //     storage: [
  //       "16GB SSD Storage",
  //       "32GB SSD Storage",
  //       "64GB SSD Storage",
  //     ],
  //     createdBy: 789,
  //     creationdate: DateTime.now(),
  //     updateddate: DateTime.now(),
  //   ),
  //   Product_Model(
  //     id: 4,
  //     name: "Sample Product 4",
  //     description: "This is a sample product description. 4",
  //     category_id: 125,
  //     make: "Sample Make 4",
  //     model: "Sample Model 4",
  //     price: "784.99",
  //     images: [
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p1.png?alt=media&token=c077254f-d397-42c5-aaf8-fe0b8a449fc8",
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p2.png?alt=media&token=56fdf9f3-796b-47c4-a0d6-0616ae5d5635",
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
  //     ],
  //     // colors: [
  //     //   "Red",
  //     //   "Blue",
  //     //   "Green",
  //     // ],
  //     memory: [
  //       "16GB",
  //       "32GB",
  //       "64GB",
  //     ],
  //     storage: [
  //       "16GB SSD Storage",
  //       "32GB SSD Storage",
  //       "64GB SSD Storage",
  //     ],
  //     createdBy: 456,
  //     creationdate: DateTime.now(),
  //     updateddate: DateTime.now(),
  //   ),
  //   Product_Model(
  //     id: 5,
  //     name: "Sample Product 5",
  //     description: "This is a sample product description. 5",
  //     category_id: 123,
  //     make: "Sample Make 5",
  //     model: "Sample Model 5",
  //     price: "502.99",
  //     images: [
  //       "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p6.png?alt=media&token=ed7cd206-d1f6-4f40-b86d-e79730c16c14",
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
  //       'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
  //     ],
  //     // colors: [
  //     //   "Red",
  //     //   "Blue",
  //     //   "Green",
  //     // ],
  //     memory: [
  //       "16GB",
  //       "32GB",
  //       "64GB",
  //     ],
  //     storage: [
  //       "16GB SSD Storage",
  //       "32GB SSD Storage",
  //       "64GB SSD Storage",
  //     ],
  //     createdBy: 456,
  //     creationdate: DateTime.now(),
  //     updateddate: DateTime.now(),
  //   )
  // ];
}
