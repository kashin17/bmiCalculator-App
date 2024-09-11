import 'package:bmi_calculator/k-constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData? icon;
  final Function? onPress;
  const RoundIconButton({
    this.icon,
    this.onPress,
});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress as void Function()?,
      elevation: 2.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
    );
  }
}
