import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/custom/back_button.dart';

class privacy_policy extends StatefulWidget {
  const privacy_policy({super.key});

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Privacy Policy".tr,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        leading: back_button(
          ontap: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "1. Types of data we collected".tr,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("lorem 30 line text here")),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "2. Use of your personal data".tr,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("lorem 30 line text here")),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "2. Disclose of Your Data".tr,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("lorem 30 line text here"))
            ],
          ),
        ),
      ),
    );
  }
}