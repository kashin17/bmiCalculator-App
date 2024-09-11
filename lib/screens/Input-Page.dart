import 'package:bmi_calculator/bmi-calculation.dart';
import 'package:bmi_calculator/k-constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Reusable-Card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Bottom-button.dart';
import '../components/Bottom-cards.dart';
import '../components/Icon-card.dart';
import 'Results-Page.dart';

enum Gender {
  Male,
  Female,
}


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int Age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                    colour: selectedGender==Gender.Male ? k_activeCardColor : k_inactiveCardColor,
                    cardChild: const IconCard(icon: FontAwesomeIcons.mars,label: 'Male',),

                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress:(){
                    setState(() {
                      selectedGender = Gender.Female;
                    });},
                    colour: selectedGender == Gender.Female ? k_activeCardColor : k_inactiveCardColor,
                    cardChild: const IconCard(icon: FontAwesomeIcons.venus, label:'Female',),
                ),
              )
            ],
          )),

          Expanded(child: ReusableCard(

              colour: k_activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: k_labelTxtStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                          height.toString(),
                        style: k_NumberTxtStyle,
                      ),
                      Text('cm',
                      style: k_labelTxtStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0)
                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged:(double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    }),
                  )
                ],
              ),
          ),
          ),

          Expanded(child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    colour: k_activeCardColor,
                  cardChild: BottomCard(
                    label: 'Weight',
                    value: weight.toString(),
                    plus: (){
                      setState(() {
                        weight++;
                      });
                    },
                    minus: (){
                      setState(() {
                        weight--;
                      });
                    },
                  )
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: k_activeCardColor,
                  cardChild: BottomCard(
                    label: 'Age',
                    value: Age.toString(),
                    plus: (){
                      setState(() {
                        Age++;
                      });
                    },
                    minus: (){
                      setState(() {
                        Age--;
                      });
                    },
                  ),
                 ),

              ),
            ],
          )),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              BmiCalculation calc= BmiCalculation(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              );
            }));
            },
          ),
        ],
      ),
    );
  }
}

