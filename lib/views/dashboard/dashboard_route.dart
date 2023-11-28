import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:gov_flutter_copy_app/routes/app_route.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_navigator.dart';
import 'package:gov_flutter_copy_app/views/paycheck_details/paycheck_details_route.dart';

import './view/dashboard_page.dart';


class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.5, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );
    },
  );
}


class DashboardRoute extends AppRoute {

  // calls route page once, to add to the widget
  GoRoute getRoute() {

    return GoRoute(
      path: routePath,
      builder: getPage,


    );
  }

  Widget getPage(BuildContext context, GoRouterState state) {




    return Container(
 /// Complete page Refresh on navigation
        child: Provider(

            create: (_) => DashboardNavigator(),
            child: DashboardPage()));
  }


  String get routePath => "/Dashboard";
}