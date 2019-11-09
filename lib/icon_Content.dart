import 'package:flutter/material.dart';
import 'Constants.dart';

class ReusableColumn extends StatelessWidget {
  ReusableColumn({this.IconContent, this.label });
  final IconData IconContent;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          IconContent,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: labelTextStyle
        )
      ],
    );
  }
}
