import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Product_Card extends StatelessWidget {
  final String imageurl;
  final String product_name;
  final String price;
  final String status;
   final Function()? ontap;
  const Product_Card(
      {super.key,
      required this.imageurl,
      required this.product_name,
      required this.price,
      required this.status,
      this.ontap
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 175,
        width: 175,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).disabledColor.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(1.0, 1.0))
            ]),
        child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: -30,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      child: Image.asset(imageurl),
                    ),
                  )),
              Column(
                children: [
                  Text(
                    product_name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600),
                  ).pOnly(bottom: 10),
                  Text(
                    price,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                fontFamily: 'plusjakarta',
                        fontSize: 15,
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ).pOnly(top: 90),
              status.isNotEmpty
                  ? Positioned(
                      bottom: -10,
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).indicatorColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            status,
                            style: TextStyle(
                              
                fontFamily: 'plusjakarta',
                                color: Theme.of(context).secondaryHeaderColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 10),
                          )))
                  : SizedBox()
            ]),
      ),
    );
  }
}
