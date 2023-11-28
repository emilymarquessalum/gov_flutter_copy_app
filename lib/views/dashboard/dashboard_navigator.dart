import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/routes/app_navigator.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_route.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/paycheck_details_route.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';



class DashboardNavigator extends AppNavigator {



  navigateToDetails(BuildContext context) {

    GoRouter.of(context).push(PaycheckDetailsRoute().routePath,
    extra:  context.read<ProfessionalInformationBloc>(),

    );
  }

}