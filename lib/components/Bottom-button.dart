import 'package:flutter/material.dart';
import '../k-constants.dart';

class BottomButton extends StatelessWidget {


  final Function onTap;
  final String buttonTitle;

  const BottomButton({
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        child: Center(
          child: Text(buttonTitle,
              style: k_LargeButtonTxtStyle
          ),
        ),
        color: k_bottomContainerColor,
        height: k_bottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
      ),
    );
  }
}

