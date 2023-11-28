import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_flutter_copy_app/views/dashboard/dashboard_route.dart';



class GoBackAppBar extends StatelessWidget implements PreferredSizeWidget  {

  final String? title;
  const GoBackAppBar({super.key, this.title,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title ?? "",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {

            if(!context.canPop()) {
              DashboardRoute().push(context);
              return;
            }
            context.pop();

          },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
