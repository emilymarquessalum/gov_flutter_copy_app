import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/views/dashboard/view/navigation_bar_item.dart';


class DashboardNavigationBar extends StatelessWidget {
  const DashboardNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 55,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const [
        NavigationDestination(icon: NavigationBarItem(label: "Home",
          icon: Icons.home,
        ), label: ''),
        NavigationDestination(
            icon:
            NavigationBarItem(label: "Solicitações",
              icon: Icons.assignment,
            ), label: ''),
        NavigationDestination(icon:
        NavigationBarItem(label: "Meu Perfil",
          icon: Icons.person,
        ), label: ""),

      ],
    );
  }
}
