import 'package:bmi_calculator/k-constants.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {

   final IconData icon;
   final String label;

  const IconCard({
    super.key,

    required this.icon,
    required this.label,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(icon,
      size: 80,),
    const SizedBox(height: 15,),
    Text(label,
    style: k_labelTxtStyle),
    ],
    );
  }
}
