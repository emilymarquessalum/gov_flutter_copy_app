import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/widgets/paycheck_details_card.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/style/paycheck_type_style.dart';

class PaycheckDetailsCardsList extends StatelessWidget {
  const PaycheckDetailsCardsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
      PaycheckInformationType.brute,
      PaycheckInformationType.discount,
    ]
            .map(
              (e) => PaycheckDetailsCard(
                paycheckType: e,
              ),
            )
            .toList());
  }
}
