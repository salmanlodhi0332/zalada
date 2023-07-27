import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/address.dart';
import 'package:zalada_app/custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/select_address_card.dart';

class select_address extends StatelessWidget {
  select_address({super.key});

  RxBool select_home = false.obs;

  RxBool select_office = false.obs;

  RxBool select_apartment = false.obs;

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
        }).p(10),
        title: Text(
          "Address".tr,
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontFamily: 'plusjakarta',
          ),
        ),
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
              Button_Widget(
                title: "Select_Address".tr,
                tap: () {
                  Get.to(address());
                },
                width: size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
