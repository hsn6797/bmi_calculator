import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.lable, @required this.onTap});

  String lable;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            lable,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
