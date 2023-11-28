






import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {

  // calls route page once, to add to the widget
  RouteBase getRoute();

  Widget getPage(BuildContext context, GoRouterState state);


  String get routePath;


  push(BuildContext context) {
    GoRouter.of(context).push(routePath);
  }

  go(BuildContext context) {
    GoRouter.of(context).go(routePath);
  }
}


