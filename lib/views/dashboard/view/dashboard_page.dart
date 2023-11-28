import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/shared_widgets/base_customs/custom_appbar.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_navigator.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_route.dart';
import 'package:gov_flutter_copy_app/views/dashboard/view/dashboard_body.dart';
import 'package:gov_flutter_copy_app/views/dashboard/view/dashboard_navigation_bar.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<PaycheckInformationBloc>().add(
      LoadPaycheckInformationEvent()
    );

    context.read<ProfessionalInformationBloc>().add(
      LoadProfessionalInformationEvent()
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppBar(),
      body: DashboardBody(),
      bottomNavigationBar: const DashboardNavigationBar(),
      drawer: const Drawer(),
    );
  }
}
