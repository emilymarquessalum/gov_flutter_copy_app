


import 'package:flutter/cupertino.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';

class PaycheckRecord {


  final List<PaycheckInformation> paychecks;

  final DateTime date;

  PaycheckRecord({required this.paychecks, required this.date});

  static PaycheckRecord fromJson(Map<String, dynamic> data) {


    List<PaycheckInformation> paychecks = [];

    debugPrint(data.toString());

    for(String type in data["paycheck"].keys) {
      paychecks.addAll((data["paycheck"][type] as List)
          .map(
              (e) {
                e["type"] = type;
                return PaycheckInformation.fromJson(e);
      }).toList());
    }

    return PaycheckRecord(
      paychecks: paychecks,
      date: DateTime.parse(data["date"])
    );
  }
}