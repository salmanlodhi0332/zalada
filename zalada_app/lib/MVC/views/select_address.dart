import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/custom/back_button.dart';

import '../../custom/botton_widget.dart';
import '../../custom/select_address_card.dart';

class select_address extends StatefulWidget {
  const select_address({super.key});

  @override
  State<select_address> createState() => _select_addressState();
}

class _select_addressState extends State<select_address> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: back_button(ontap: () {
          Get.back();
        }),
        title: Text(
          "Address".tr,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            select_address_card(
              hintText: "JI.Pangkui,Ngaglik,Salme",
              label: 'Home',
              preffixIcon: Icon(Icons.credit_card),
              selected: true,
              NumberText: "+3322469178",
            ),
            SizedBox(
              height: 20,
            ),
            select_address_card(
              hintText: "JI.Pangkui,Ngaglik,Salme",
              label: 'Office',
              NumberText: "+3322469178",
              preffixIcon: Icon(Icons.credit_card),
              selected: false,
            ),
            SizedBox(
              height: 20,
            ),
            select_address_card(
              hintText: "JI.Pangkui,Ngaglik,Salme",
              label: 'Apartment',
              preffixIcon: Icon(Icons.credit_card),
              selected: false,
              NumberText: "+3322469178",
            ),
            SizedBox(
              height: 30,
            ),
            Button_Widget(
              title: "Select_Address".tr,
              tap: () {},
              width: size.width,
            ),
          ],
        ),
      ),
    );
  }
}
