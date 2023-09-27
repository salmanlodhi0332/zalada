import '../MVC/model/product_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final int categoryId;
  final String make;
  final String model;
  final double price;
  final List<String> images;
  final List<String> memory;
  final List<String> storage;
  final int createdBy;
  final DateTime creationDate;
  final DateTime updatedDate;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.make,
    required this.model,
    required this.price,
    required this.images,
    required this.memory,
    required this.storage,
    required this.createdBy,
    required this.creationDate,
    required this.updatedDate,
  });
}

class product_dummyData {
  static List<ProductModel> dummyProducts = [
    ProductModel(
      id: 1,
      name: "Sample Product 1",
      description: "This is a sample product description. 1",
      categoryId: 123,
      make: "Sample Make 1",
      model: "Sample Model 1",
      price: 78.99,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
      ],
      memory: [
        "16GB",
        "32GB",
        "64GB",
      ],
      storage: [
        "16GB SSD Storage",
        "32GB SSD Storage",
        "64GB SSD Storage",
      ],
      createdBy: 456,
      creationDate: DateTime.now(),
      updatedDate: DateTime.now(),
    ),
    ProductModel(
      id: 2,
      name: "Sample Product 2",
      description: "This is a sample product description. 2",
      categoryId: 163,
      make: "Sample Make 2",
      model: "Sample Model 2",
      price: 123.99,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
      ],
      memory: [
        "16GB",
        "32GB",
        "64GB",
      ],
      storage: [
        "16GB SSD Storage",
        "32GB SSD Storage",
        "64GB SSD Storage",
      ],
      createdBy: 456,
      creationDate: DateTime.now(),
      updatedDate: DateTime.now(),
    ),
    ProductModel(
      id: 3,
      name: "Sample Product 3",
      description: "This is another sample product description. 3",
      categoryId: 456,
      make: "Sample Make 3",
      model: "Sample Model 3",
      price: 149.99,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p2.png?alt=media&token=56fdf9f3-796b-47c4-a0d6-0616ae5d5635",
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
      ],
      memory: [
        "128GB",
        "256GB",
      ],
      storage: [
        "16GB SSD Storage",
        "32GB SSD Storage",
        "64GB SSD Storage",
      ],
      createdBy: 789,
      creationDate: DateTime.now(),
      updatedDate: DateTime.now(),
    ),
    ProductModel(
      id: 4,
      name: "Sample Product 4",
      description: "This is a sample product description. 4",
      categoryId: 125,
      make: "Sample Make 4",
      model: "Sample Model 4",
      price: 784.99,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p1.png?alt=media&token=c077254f-d397-42c5-aaf8-fe0b8a449fc8",
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p2.png?alt=media&token=56fdf9f3-796b-47c4-a0d6-0616ae5d5635",
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p3.png?alt=media&token=162c186d-b48f-49de-8995-f219afc6c42b",
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
      ],
      memory: [
        "16GB",
        "32GB",
        "64GB",
      ],
      storage: [
        "16GB SSD Storage",
        "32GB SSD Storage",
        "64GB SSD Storage",
      ],
      createdBy: 456,
      creationDate: DateTime.now(),
      updatedDate: DateTime.now(),
    ),
    ProductModel(
      id: 5,
      name: "Sample Product 5",
      description: "This is a sample product description. 5",
      categoryId: 123,
      make: "Sample Make 5",
      model: "Sample Model 5",
      price: 502.99,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p6.png?alt=media&token=ed7cd206-d1f6-4f40-b86d-e79730c16c14",
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
        'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p5.png?alt=media&token=c1b4c5b4-a2d8-4680-812f-eee216620c40',
      ],
      memory: [
        "16GB",
        "32GB",
        "64GB",
      ],
      storage: [
        "16GB SSD Storage",
        "32GB SSD Storage",
        "64GB SSD Storage",
      ],
      createdBy: 456,
      creationDate: DateTime.now(),
      updatedDate: DateTime.now(),
    )
  ];
}
