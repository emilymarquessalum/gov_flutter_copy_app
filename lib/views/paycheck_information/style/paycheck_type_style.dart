

import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';



class PaycheckTypeStyle {

  final PaycheckInformationType type;


  PaycheckTypeStyle({required this.type});

  // labelling
  String get labelFromType => {
    PaycheckInformationType.brute: "Bruto",
    PaycheckInformationType.liquid: "Liquido",
    PaycheckInformationType.discount: "Descontos",
  }[type] ?? "Indefinido";


  String get titleFromType => {
    PaycheckInformationType.brute: "Rendimentos",
    PaycheckInformationType.liquid: "Liquido",
    PaycheckInformationType.discount: "Descontos",
  }[type] ?? "Indefinido";



  // graphical
  IconData? get iconData => {
    PaycheckInformationType.brute: Icons.add_circle,
    PaycheckInformationType.liquid: Icons.remove_circle,
    PaycheckInformationType.discount: Icons.check_circle,
  }[type] ?? Icons.error;


  Color colorFromType() {

    return {
      PaycheckInformationType.brute: Colors.green,
      PaycheckInformationType.liquid: Colors.blue,
      PaycheckInformationType.discount: Colors.red,
    }[type] ?? Colors.grey;
  }

  static List<PaycheckInformationType> get viewingOrder => [
    PaycheckInformationType.brute,
    PaycheckInformationType.discount,
    PaycheckInformationType.liquid,
  ];

}
