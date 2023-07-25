import 'package:flutter/material.dart';
import 'package:zalada_app/custom/forget_password_widget/selectedbox.dart';

import '../custom/back_button.dart';
import '../custom/payment_card.dart';
import '../custom/payment_methods/paymentgetway_selected.dart';

class payment_method extends StatefulWidget {
  const payment_method({super.key});

  @override
  State<payment_method> createState() => _payment_methodState();
}

class _payment_methodState extends State<payment_method> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: back_button(ontap: () {}),
          title: Text(
            "Payment Method",
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: payment_card(
                    hintText: "*****53618",
                    label: 'Master Card',
                    preffixIcon: Icon(Icons.credit_card),
                    selected: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: payment_card(
                    hintText: "*****53618",
                    label: 'PayPal',
                    preffixIcon: Icon(Icons.credit_card),
                    selected: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Add Another Method",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: payment_card(
                    hintText: "Pay with  visa or MasterCard",
                    label: 'Credit or Debit Card',
                    preffixIcon: Icon(Icons.credit_card),
                    selected: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: payment_card(
                    hintText: "",
                    label: 'PayPal',
                    preffixIcon: Icon(Icons.credit_card),
                    selected: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pay Later",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: payment_card(
                    hintText: "",
                    label: 'Kredivo',
                    preffixIcon: Icon(Icons.credit_card),
                    selected: false,
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
