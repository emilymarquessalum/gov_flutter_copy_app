

import 'package:flutter/material.dart';



class FieldInformationText extends StatelessWidget {
  final String title;
  final String information;

  final TextStyle? textStyle;
  const FieldInformationText({super.key,
    this.textStyle,
  required this.title, required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
        style: textStyle,),
        Text(information,
        style: textStyle,),
      ],
    );
  }
}
