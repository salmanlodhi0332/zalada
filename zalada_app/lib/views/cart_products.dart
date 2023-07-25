import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  int quantity = 1;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Checkbox(
          activeColor: Theme.of(context).indicatorColor,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        SizedBox(width: 10),
        Image.asset(
          'assets/images/item.png',
          width: 130,
          height: 130,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Macbook Pro 15" 2019 - Intel core i7',
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
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: '\$1029',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(quantity.toString()),
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
                        setState(() {
                          quantity++;
                        });
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
                      onPressed: () {},
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
