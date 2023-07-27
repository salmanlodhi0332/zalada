// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CartProducts extends StatefulWidget {
//   @override
//   _CartProductsState createState() => _CartProductsState();
// }

// class _CartProductsState extends State<CartProducts> {
//   int quantity = 1;
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(width: 10),
//         Checkbox(
//           activeColor: Theme.of(context).indicatorColor,
//           value: isChecked,
//           onChanged: (bool? value) {
//             setState(() {
//               isChecked = value ?? false;
//             });
//           },
//         ),
//         SizedBox(width: 0),
//         // Image.asset(
//         //   'assets/images/success.png',
//         //   width: 130,
//         //   height: 130,
//         //   fit: BoxFit.cover,
//         // ),

//         Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).highlightColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           width: 120,
//           height: 120,
//           child: Image.asset(
//             'assets/images/success.png',
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//           ),
//         ),
//         SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Macbook Pro 15" 2019 - Intel core i7',
//                 maxLines: 2,
//               ),
//               SizedBox(height: 5),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text.rich(TextSpan(children: [
//                     TextSpan(
//                       text: '\$910 ',
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Theme.of(context).hintColor,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'plusjakarta'),
//                     ),
//                     TextSpan(
//                       text: '\$1029',
//                       style: TextStyle(
//                           decoration: TextDecoration.lineThrough,
//                           fontFamily: 'plusjakarta',
//                           fontSize: 12,
//                           color:
//                               Theme.of(context).disabledColor.withOpacity(0.5),
//                           fontWeight: FontWeight.w600),
//                     )
//                   ])),
//                 ],
//               ),
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor:
//                         Theme.of(context).disabledColor.withOpacity(0.3),
//                     radius: 15,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.remove,
//                         size: 15,
//                         color: Theme.of(context).hintColor,
//                       ),
//                       onPressed: () {
//                         if (quantity > 1) {
//                           setState(() {
//                             quantity--;
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(quantity.toString()),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   CircleAvatar(
//                     backgroundColor:
//                         Theme.of(context).disabledColor.withOpacity(0.3),
//                     radius: 15,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.add,
//                         size: 15,
//                         color: Theme.of(context).hintColor,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           quantity++;
//                         });
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   CircleAvatar(
//                     backgroundColor:
//                         Theme.of(context).disabledColor.withOpacity(0.1),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.delete_outline,
//                         size: 21,
//                       ),
//                       color: Theme.of(context).errorColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zalada_app/MVC/controller/product_controller.dart';
import 'package:zalada_app/MVC/model/product_model.dart';

class CartProducts extends StatelessWidget {
  final cart_Controller controller;
  final Product_Model dummyProducts;
  final int quantity;

  const CartProducts(
      {super.key,
      required this.controller,
      required this.dummyProducts,
      required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Checkbox(
          activeColor: Theme.of(context).indicatorColor,
          value:
              false, // Since it's a stateless widget, there's no state to manage isChecked
          onChanged: (bool? value) {
            // You can add functionality here if you need to handle checkbox changes
          },
        ),
        SizedBox(width: 0),
        // Image.asset(
        //   'assets/images/success.png',
        //   width: 130,
        //   height: 130,
        //   fit: BoxFit.cover,
        // ),

        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 120,
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              dummyProducts.images[0],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // 'Macbook Pro 15" 2019 - Intel core i7',
                dummyProducts.name,
                maxLines: 2,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '\$910 ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'plusjakarta'),
                    ),
                    TextSpan(
                      text: '\$1029',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontFamily: 'plusjakarta',
                          fontSize: 12,
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                    )
                  ])),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).disabledColor.withOpacity(0.3),
                    radius: 15,
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 15,
                        color: Theme.of(context).hintColor,
                      ),
                      onPressed: () {
                        controller.removeProduct(dummyProducts);
                        // No need to handle quantity changes since it's a stateless widget
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${quantity}'),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).disabledColor.withOpacity(0.3),
                    radius: 15,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 15,
                        color: Theme.of(context).hintColor,
                      ),
                      onPressed: () {
                        controller.addProduct(dummyProducts);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).disabledColor.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        controller.removeCartItem(dummyProducts);
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        size: 21,
                      ),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
