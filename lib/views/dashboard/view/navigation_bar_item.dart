import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {

  final String label;
  final IconData icon;
  const NavigationBarItem({
    super.key, required  this.label, required  this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Column(
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}
