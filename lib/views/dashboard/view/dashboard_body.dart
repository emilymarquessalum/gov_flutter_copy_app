


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/shared_widgets/listing/simple_scroll_view.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/view/paycheck_information_view.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/professional_information/view/professional_information_view.dart';
import 'package:gov_flutter_copy_app/views/solicitations/view/solicitations_view.dart';


class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<PaycheckInformationBloc>(context)
              .add(UpdatePaycheckInformationEvent());
          BlocProvider.of<ProfessionalInformationBloc>(context)
              .add(
              UpdateProfessionalInformationEvent());
          return await Future.delayed(const Duration(seconds: 1));
        },
      child: SimpleScrollView(
        scrollPadding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Olá, Pedrinho!",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 22
                  ),
                ),
                const Icon(Icons.credit_card, size: 32,),
              ],
            ),

            const ProfessionalInformationView(),


            const PaycheckInformationView(),

            const SolicitationsView(),


//            Text(context.read<PaycheckInformationBloc>().stateCalls.toString()),

          ],
        ),
      ),
    );
  }
}
