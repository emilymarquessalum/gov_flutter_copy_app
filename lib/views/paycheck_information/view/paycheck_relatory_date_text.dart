import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/models/extensions/date_br.dart';

class PaycheckRecordDateText extends StatelessWidget {
  final DateTime date;
  const PaycheckRecordDateText({
    super.key, required  this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Contracheque | ${date.monthLabel()} ${date.year}" ,
    style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
