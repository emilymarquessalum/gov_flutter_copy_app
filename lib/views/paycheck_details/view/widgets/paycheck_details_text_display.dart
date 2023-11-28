import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/style/paycheck_type_style.dart';

class PaycheckDetailsTextDisplay extends StatelessWidget {
  const PaycheckDetailsTextDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(PaycheckInformationType type in PaycheckTypeStyle.viewingOrder)
          Expanded(child: PaycheckDetailsTextDisplayItem(type: type))
      ],
    );
  }
}

class PaycheckDetailsTextDisplayItem extends StatelessWidget {
  const PaycheckDetailsTextDisplayItem({
    super.key,
    required this.type,
  });

  final PaycheckInformationType type;

  @override
  Widget build(BuildContext context) {

    PaycheckTypeStyle paycheckTypeStyle = PaycheckTypeStyle(type: type);

    TextStyle? style = Theme.of(context).textTheme.displaySmall?.copyWith(
      color: paycheckTypeStyle.colorFromType(),
      fontSize: 14
    );

    return Column(
      children: [
        Text(
          PaycheckTypeStyle(type: type).labelFromType,
          style:style,
        ),
        Text(
          BlocProvider.of<PaycheckInformationBloc>(context).getPaychecksInformationByType(type).getSum().toString(),
          style: style,
        ),
      ],
    );
  }
}
