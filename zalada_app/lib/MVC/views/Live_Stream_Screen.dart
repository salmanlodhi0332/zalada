import 'package:flutter/material.dart';
import 'package:zalada_app/custom/custom_appbar.dart';

class Live_Stream_Screen extends StatelessWidget {
  const Live_Stream_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar(title: 'Live'),
      body: Center(
        child: Text("No data"),
      ),
    );
  }
}
