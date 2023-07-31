import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/select_Address.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import '../../custom/botton_widget.dart';
import '../../custom/select_address_card.dart';
import '../../utiles/page_navigation.dart';
import 'confirm_order.dart';

class Address_Screen extends StatelessWidget {
  Address_Screen({super.key});

  RxBool select_home = false.obs;

  RxBool select_office = false.obs;

  RxBool select_apartment = false.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Custom_Appbar(
        title: "Address".tr,
        leadingButton: back_button(ontap: () {
          Get.back();
        }),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Obx(() => InkWell(
                    onTap: () {
                      // Use the observable variables here to trigger updates
                      select_home.value = !select_home.value;
                      select_apartment.value = false;
                      select_office.value = false;
                    },
                    child: select_address_card(
                      hintText: "JI.Pangkui,Ngaglik,Salme",
                      label: 'Home',
                      image: Image.asset("assets/images/house.png"),
                      preffixIcon: Icon(Icons.credit_card),
                      // Use the observable variables here to determine the selected state
                      selected: select_home.value,
                      NumberText: "+3322469178",
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Obx(() => InkWell(
                    onTap: () {
                      select_home.value = false;
                      select_apartment.value = false;
                      select_office.value = !select_office.value;
                    },
                    child: select_address_card(
                      hintText: "JI.Pangkui,Ngaglik,Salme",
                      label: 'Office',
                      NumberText: "+3322469178",
                      // preffixIcon: Icon(Icons.credit_card),S
                      // Use the observable variables here to determine the selected state
                      selected: select_office.value,
                      image: Image.asset("assets/images/office.png"),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Obx(() => InkWell(
                    onTap: () {
                      select_home.value = false;
                      select_apartment.value = !select_apartment.value;
                      select_office.value = false;
                    },
                    child: select_address_card(
                      hintText: "JI.Pangkui,Ngaglik,Salme",
                      label: 'Apartment',
                      preffixIcon: Icon(Icons.credit_card),
                      // Use the observable variables here to determine the selected state
                      selected: select_apartment.value,
                      image: Image.asset("assets/images/apartment.png"),
                      NumberText: "+3322469178",
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              // Button_Widget(
              //   title: "Select_Address".tr,
              //   ontap: () {
              //     Get.to(address());
              //   },
              //   width: size.width,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.white70.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(1.0, 1.0), // soften the shadow
                spreadRadius: 0.0, //extend the shadow
              ),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          children: [
            Button_Widget(
                    ontap: () {
                      Page_Navigation.getInstance.Page(context, ConfirmOrder());
                    },
                    width: size.width / 1.5,
                    title: "continue".tr)
                .py(11),
            back_button(
              ontap: () {
                Page_Navigation.getInstance.Page(context, Select_Address());
              },
              pic: Icon(
                Icons.add,
                color: Theme.of(context).hoverColor,
              ).p(15),
            ),
          ],
        ),
      ),
    );
  }
}
