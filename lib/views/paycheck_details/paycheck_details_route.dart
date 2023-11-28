import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/models/extensions/for_go_router_state.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';

import '../../routes/app_route.dart';
import './view/paycheck_details_page.dart';


class PaycheckDetailsRoute extends AppRoute {

  // calls route page once, to add to the widget
  GoRoute getRoute() {
    return GoRoute(
      path: routePath,
      builder: getPage,
    );
  }

  Widget getPage(BuildContext context, GoRouterState state) {

    return PaycheckDetailsPage(
    );
  }


  String get routePath => "/PaycheckDetails";
}