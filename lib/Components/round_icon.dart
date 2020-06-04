import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  RoundIcon({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 35.0,
        height: 35.0,
      ),
    );
  }
}
