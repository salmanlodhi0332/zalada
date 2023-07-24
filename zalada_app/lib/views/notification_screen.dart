import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';

class Notification_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;
    final ph = 20.0;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: back_button(ontap: () {
          Get.back();
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'your_notification'.tr,
                  style: TextStyle(
                      fontSize: 24,
                      
                fontFamily: 'plusjakarta',
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).hintColor),
                ),
                Text(
                  'today'.tr,
                  style: TextStyle(
                    
                fontFamily: 'plusjakarta',
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).hintColor),
                ).py(15),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            Theme.of(context).disabledColor.withOpacity(0.2)),
                    child: Image.asset(
                      'assets/images/cart.png',
                      height: 30,
                      color: Vx.red800,
                    ).p(12),
                  ),
                  title: Text(
                    '30% Special Discount!',
                    style: TextStyle(
                      
                fontFamily: 'plusjakarta',fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Special promo to all apple device'),
                ),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            Theme.of(context).disabledColor.withOpacity(0.2)),
                    child: Image.asset(
                      'assets/images/cart.png',
                      height: 30,
                      color: Vx.red800,
                    ).p(12),
                  ),
                  title: Text(
                    '30% Special Discount!',
                    style: TextStyle(
                      
                fontFamily: 'plusjakarta',fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Special promo to all apple device'),
                ),
              ],
            ).px(20),
            Divider(
              color: Theme.of(context).disabledColor.withOpacity(0.2),
              thickness: 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'yesterday'.tr,
                  style: TextStyle(
                    
                fontFamily: 'plusjakarta',
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).hintColor),
                ).py(15),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            Theme.of(context).disabledColor.withOpacity(0.2)),
                    child: Image.asset(
                      'assets/images/cart.png',
                      height: 30,
                      color: Vx.red800,
                    ).p(12),
                  ),
                  title: Text(
                    '30% Special Discount!',
                    style: TextStyle(
                      
                fontFamily: 'plusjakarta',fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Special promo to all apple device'),
                ),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            Theme.of(context).disabledColor.withOpacity(0.2)),
                    child: Image.asset(
                      'assets/images/cart.png',
                      height: 30,
                      color: Vx.red800,
                    ).p(12),
                  ),
                  title: Text(
                    '30% Special Discount!',
                    style: TextStyle(
                      
                fontFamily: 'plusjakarta',fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Special promo to all apple device'),
                ),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            Theme.of(context).disabledColor.withOpacity(0.2)),
                    child: Image.asset(
                      'assets/images/cart.png',
                      height: 30,
                      color: Vx.red800,
                    ).p(12),
                  ),
                  title: Text(
                    '30% Special Discount!',
                    style: TextStyle(
                      
                fontFamily: 'plusjakarta',fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Special promo to all apple device'),
                ),
              ],
            ).px(20),
          ],
        ),
      ),
    );
  }
}
