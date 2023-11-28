import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/routes/router.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_route.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';

import 'views/professional_information/bloc/professional_information_bloc.dart';

void main() {

  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = SystemAppRouter(

      initialRoute: DashboardRoute().routePath

  );

  PaycheckInformationBloc _paycheckInformationBloc = PaycheckInformationBloc(
  );

  ProfessionalInformationBloc _professionalInformationBloc =
      ProfessionalInformationBloc();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _paycheckInformationBloc),

        BlocProvider<ProfessionalInformationBloc>.value(
          value: _professionalInformationBloc,
        ),
      ],
      child: MaterialApp.router(
        title: 'SOU.GOB.BR.EMILY.SALUM',
        debugShowCheckedModeBanner: false,
      
      
          routerConfig: _appRouter,
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: accentColor()).copyWith(
      
      
          ),
          primaryColor: accentColor(),
            scaffoldBackgroundColor:
      
            const Color(0xfffafafa),
      
          appBarTheme: AppBarTheme(
            backgroundColor:accentColor(),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
          ),
      
          iconTheme: IconThemeData(
            color: accentColor(),
          ),
      
          navigationBarTheme: const NavigationBarThemeData(
          ),
          useMaterial3: true,
      
          textTheme: Theme.of(context).textTheme.copyWith(
            displaySmall: TextStyle(
              fontSize: 10,
              color: accentColor(),
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              fontSize: 14,
              color: accentColor(),
              fontWeight: FontWeight.bold,
            ),
      
            headlineSmall: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      
            titleMedium: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ),
        //home: const DashboardPage()
      ),
    );
  }

  Color accentColor() => const Color(0xff1952b0);
}
