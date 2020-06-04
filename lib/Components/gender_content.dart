import 'package:flutter/material.dart';
import '../constants.dart';

class GenderContent extends StatelessWidget {
  GenderContent({this.icon, this.lable});

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSpaceBetween,
        ),
        Text(
          lable,
          style: kLableTextStyle,
        )
      ],
    );
  }
}
