import 'package:bmi_calculator/components/Bottom-button.dart';
import 'package:bmi_calculator/components/Reusable-Card.dart';
import 'package:flutter/material.dart';
import '../k-constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  const ResultsPage({
   required this.bmiResult,
   required this.interpretation,
    required this.resultText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: k_TitleTxtStyle,
            ),
          ),),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: k_activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(),
                    style: k_resultTxtStyle,),
                    Text(bmiResult,
                    style: k_BMITxtStyle,
                    ),
                    Text(interpretation,
                    textAlign: TextAlign.center,
                    style: k_BodyTxtStyle,)
                  ],
                )

          )),
          BottomButton(buttonTitle:'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
