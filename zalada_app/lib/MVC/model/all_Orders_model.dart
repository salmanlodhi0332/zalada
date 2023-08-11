import 'package:zalada_app/MVC/model/product_model.dart';

class AllOrders_Model {
  final int id;
  final int address_id;
  final int shipping_id;
  final String total_payment;
  final String status;
  final int invoice_number;
  final String? due_date;
  final String createdAt;
  final String updatedAt;
  final int paymentmethod_id;
  final int user_id;
  final List<Orders> order_items;

  AllOrders_Model({
    required this.id,
    required this.address_id,
    required this.shipping_id,
    required this.total_payment,
    required this.status,
    required this.invoice_number,
    this.due_date,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentmethod_id,
    required this.user_id,
    required this.order_items,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'address_id': address_id,
        'shipping_id': shipping_id,
        'total_payment': total_payment,
        'status': status,
        'invoice_number': invoice_number,
        'due_date': due_date,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'paymentmethod_id': paymentmethod_id,
        'user_id': user_id,
        'order_items': order_items,
      };

  factory AllOrders_Model.fromjson(Map<String, dynamic> json) {
    List<dynamic> order_itemsData = json['order_items'] ?? [];

    return AllOrders_Model(
      id: json['id'],
      address_id: json['address_id'],
      shipping_id: json['shipping_id'],
      total_payment: json['total_payment'].toString(),
      status: json['status'],
      invoice_number: json['invoice_number'],
      due_date: json['due_date'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      paymentmethod_id: json['paymentmethod_id'],
      user_id: json['user_id'],
      order_items: order_itemsData
          .map((order_itemsJson) => Orders.fromJson(order_itemsJson))
          .toList(),
    );
  }
}

class Orders {
  final int product_id;
  final int quantity;

  Orders({
    required this.product_id,
    required this.quantity,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      product_id: json['product_id'],
      // == null ? "" : json['product_id'],
      quantity: json['quantity'],
    );
  }
}
