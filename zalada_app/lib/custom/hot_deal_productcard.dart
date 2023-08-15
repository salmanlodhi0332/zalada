import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class Hot_deal_Product_Card extends StatelessWidget {
  const Hot_deal_Product_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Image.asset('assets/images/item.png'),
                  ),
                )),
            Column(
              children: [
                Text(
                  'Macbook Pro 15" 2019 -Intel corei7',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600),
                ).pOnly(bottom: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '\$1240',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Theme.of(context).focusColor,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '\$1540',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.5),
                            fontWeight: FontWeight.w600),
                      )
                    ])),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                        backgroundColor: Theme.of(context).hoverColor,
                      ),
                    )
                  ],
                )
              ],
            ).pOnly(top: 90),
          ]),
    );
  }
}
