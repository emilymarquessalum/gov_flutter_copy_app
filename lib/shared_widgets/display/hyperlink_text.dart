import 'package:flutter/material.dart';

class HyperlinkText extends StatelessWidget {

  final String label;
  final Icon? icon;
  final Function()? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  const HyperlinkText({Key? key, required this.label,
    this.mainAxisAlignment,
    this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          )
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
          ),
          icon ?? Container()
        ],
      ),
    );
  }
}
