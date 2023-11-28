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



  late ProfessionalInformationBloc professionalInformationBloc;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    context.read<PaycheckInformationBloc>().add(
      LoadPaycheckInformationEvent()
    );
    professionalInformationBloc =  ProfessionalInformationBloc(
      loadRightAway: true,
    );


    GoRouter.of(context).routerDelegate.addListener(
      updateOnPop
    );

  }


  updateOnPop() {

    debugPrint("updateOnPop");

    //debugPrint("previousRoute: ${previousRoute?.settings.name}");


    if(GoRouter.of(context).routerDelegate.currentConfiguration.uri.path
        == DashboardRoute().routePath) {


      //paycheckInformationBloc.add(LoadPaycheckInformationEvent());
    }

  }

  @override
  void dispose() {
    super.dispose();
    //paycheckInformationBloc.close();
    professionalInformationBloc.close();
    GoRouter.of(context).routerDelegate.removeListener(
        updateOnPop
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfessionalInformationBloc>.value(
            value: professionalInformationBloc,
          ),

        ],
        child: Container(


            child: DashboardBody()),
      ),
      bottomNavigationBar: const DashboardNavigationBar(),
      drawer: const Drawer(),
    );
  }
}
