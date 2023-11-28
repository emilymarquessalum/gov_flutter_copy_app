import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/shared_widgets/listing/simple_scroll_view.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/widgets/paycheck_details_calendar_selection.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/widgets/paycheck_details_cards_list.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/widgets/paycheck_details_text_display.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/widgets/paycheck_visualization_options_cards.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/professional_information/view/professional_information_view.dart';

class PaycheckDetailsBody extends StatelessWidget {
  const PaycheckDetailsBody({super.key});

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
        scrollPadding: const EdgeInsets.all(16.0).copyWith(bottom: 0),

        child: BlocBuilder<PaycheckInformationBloc, PaycheckInformationState>(
          /*buildWhen: (previous, current) {
        return previous is PaycheckInformationInitial;
      },*/
          builder: (context, state) {


            if(state is! PaycheckInformationLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfessionalInformationView(),
                PaycheckDetailsCalendarSelection(),
                PaycheckVisualizationOptionsCards(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.download)],
                  ),
                ),

                Text(
                  "Total",
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,
                ),
                PaycheckDetailsTextDisplay(),
                PaycheckDetailsCardsList()
              ],
            );
          },
        ),
      ),
    );

  }
}
