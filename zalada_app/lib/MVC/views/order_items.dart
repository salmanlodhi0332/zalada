import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderItems extends StatefulWidget {
  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  int quantity = 1;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            color: Theme.of(context).cardColor,
            child: Image.asset(
              'assets/images/success.png',
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Macbook Pro 15" 2019 - Intel core i7 - Grey',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'plusjakarta',
                      fontWeight: FontWeight.w700),
                ).pOnly(right: 10),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '\$910 ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).focusColor,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '\$1029',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.5),
                            fontWeight: FontWeight.w600),
                      ),
                    ])),
                    Text(
                      "x1",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'plusjakarta',
                          fontWeight: FontWeight.w700),
                    ).pOnly(right: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
