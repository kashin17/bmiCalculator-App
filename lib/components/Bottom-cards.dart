import 'package:flutter/material.dart';
import 'package:bmi_calculator/k-constants.dart';
import 'package:bmi_calculator/components/Round-icon-btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomCard extends StatelessWidget {

  final String label;
  String value;
  Function? plus;
  Function? minus;

  BottomCard({

    required this.label,
    required this.value,
    this.plus,
    this.minus,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
          style: k_labelTxtStyle,),
        Text(value,
          style: k_NumberTxtStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(icon: FontAwesomeIcons.minus,
              onPress: minus,
              ),
            SizedBox(width: 10.0,),
            RoundIconButton(icon: FontAwesomeIcons.plus,
              onPress: plus,
            ),
          ],)
      ],
    );
  }
}