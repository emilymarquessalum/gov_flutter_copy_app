import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/style/paycheck_type_style.dart';


class PaycheckCard extends StatelessWidget {

  final PaycheckInformationType paycheckInformationType;

  const PaycheckCard({super.key, required this.paycheckInformationType});

  @override
  Widget build(BuildContext context) {
    PaycheckTypeStyle paycheckTypeStyle = PaycheckTypeStyle(
      type: paycheckInformationType,
    );

    return BlocBuilder<PaycheckInformationBloc, PaycheckInformationState>(
      builder: (context, state) {

        PaycheckInformationBloc paycheckInformationBloc =
        BlocProvider.of<PaycheckInformationBloc>(context);

        return Container(
          decoration: BoxDecoration(
            //color: Colors.grey,
              border: Border(
                left: BorderSide(width: 3.0, color:
                paycheckTypeStyle.colorFromType()),
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ]
          ),

          child: Padding(
            padding: const EdgeInsets.all(8).copyWith(left: 0.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text(
                    paycheckTypeStyle.labelFromType
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(paycheckInformationBloc.visibleData ?
                        "R\$${paycheckInformationBloc
                            .getPaychecksInformationByType(paycheckInformationType).getSum()}"
                          : "*******"
                        , style: TextStyle(fontSize: 16, color:
                      paycheckTypeStyle.colorFromType()),),
                      const Padding(padding: EdgeInsets.all(2)),
                      Icon(
                        paycheckTypeStyle.iconData,
                        color: paycheckTypeStyle.colorFromType(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

        );
      },
    );
  }
}
