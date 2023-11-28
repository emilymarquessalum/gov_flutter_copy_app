



import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/routes/app_route.dart';


abstract class AppNavigator  {

  pushTo(BuildContext context, AppRoute route) {
    route.push(context);
  }

  goTo(BuildContext context, AppRoute route) {
    route.go(context);
  }
}