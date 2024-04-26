




import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/routes/app_route.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_route.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/paycheck_details_route.dart';

GoRouter SystemAppRouter({required String initialRoute}) {


  return GoRouter(
    initialLocation: initialRoute,
    routes: [

        for(AppRoute route in getModuleRoutes())
          route.getRoute(),

    ],
  );

}

// Rotas do Módulo
List<AppRoute> getModuleRoutes() => [

  DashboardRoute(),
  PaycheckDetailsRoute(),
  //PaycheckDetailsRoute(),
];

