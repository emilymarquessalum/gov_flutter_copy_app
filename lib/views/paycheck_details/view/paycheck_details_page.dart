import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/shared_widgets/listing/simple_scroll_view.dart';
import 'package:gov_flutter_copy_app/views/dashboard/view/dashboard_navigation_bar.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/view/paycheck_details_body.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_relatory.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';

import '../../../shared_widgets/base_customs/go_back_appbar.dart';

class PaycheckDetailsPage extends StatelessWidget {

  final ProfessionalInformationBloc? professionalInformationBloc;

  const PaycheckDetailsPage({Key? key, this.professionalInformationBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoBackAppBar(
        title: "Contracheque",
      ),  

      body:

      MultiBlocProvider(

          providers: [
            BlocProvider<ProfessionalInformationBloc>(
              create: (context) =>
      professionalInformationBloc ??
                  ProfessionalInformationBloc(
                loadRightAway:true,
              ),
            ),
          ],
          child: PaycheckDetailsBody()),
      bottomNavigationBar: const DashboardNavigationBar(),
      drawer: const Drawer(),
    );
  }
}
