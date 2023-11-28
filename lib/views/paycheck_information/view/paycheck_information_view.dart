import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_navigator.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/paycheck_details_page.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/style/paycheck_type_style.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/view/paycheck_card.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/view/paycheck_relatory_date_text.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';

import '../../../shared_widgets/display/hyperlink_text.dart';

class PaycheckInformationView extends StatelessWidget {
  const PaycheckInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<PaycheckInformationBloc, PaycheckInformationState>(
        builder: (context, state) {
 

          if (state is! PaycheckInformationLoaded) {
            return const Center(child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ));
          }

          PaycheckInformationBloc paycheckInformationBloc =
              BlocProvider.of<PaycheckInformationBloc>(context);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: PaycheckRecordDateText(
                      date: state.paycheckRecord.date,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      paycheckInformationBloc.add(
                          ChangePaycheckVisibilityEvent(
                              ));
                    },
                    child: Icon(
                        paycheckInformationBloc.visibleData ?
                        Icons.visibility_off : Icons.visibility),
                  ),
                ],
              ),
              const Text("Resumo do último contracheque"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (PaycheckInformationType type
                        in PaycheckTypeStyle.viewingOrder)
                      Expanded(
                          child:
                          PaycheckCard(paycheckInformationType: type,

                          )),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: HyperlinkText(
                  mainAxisAlignment: MainAxisAlignment.end,
                    label: "Meus contracheques",
                icon:   const Icon(Icons.arrow_forward_ios),

                  onTap:(){
                    context.read<DashboardNavigator>().navigateToDetails(context);
                  }
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
