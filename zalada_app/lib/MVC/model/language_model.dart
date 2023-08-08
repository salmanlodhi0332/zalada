import 'package:flutter/material.dart';

class Language_Model {
  final int id;
  final String label;
  final String prefixIcon;
  final String lancode;
  final String countrycode;

  Language_Model(
      {required this.id,
      required this.label,
      required this.prefixIcon,
      required this.lancode,
      required this.countrycode});

  Map<String, dynamic> tojson() => {
        'id': id,
        'label': label,
        'prefixIcon': prefixIcon,
        'lancode': lancode,
        'countrycode': countrycode
      };
}
