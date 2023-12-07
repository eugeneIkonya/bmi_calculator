import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/gender_tiles.dart';
import 'package:bmi_calculator/mycard.dart';
import 'package:bmi_calculator/results.dart';
import 'package:bmi_calculator/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 68;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                GenderTile(
                  'MALE',
                  FontAwesomeIcons.mars,
                  selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
                GenderTile(
                  'FEMALE',
                  FontAwesomeIcons.venus,
                  selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                )
              ],
            )),
            Expanded(
              child: MyCard(
                  kActiveCardColor,
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('HEIGHT'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kWidgetLargeText,
                            ),
                            const Text('CM')
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: const Color(0xffEB1555),
                            overlayColor: const Color(0x25eb1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 20),
                          ),
                          child: Slider(
                            min: 120,
                            max: 220,
                            value: height.toDouble(),
                            activeColor: const Color(0xffEB1555),
                            inactiveColor: Colors.white,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ]),
                  () {}),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyCard(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kWidgetSmallText,
                          ),
                          Text(
                            weight.toString(),
                            style: kWidgetLargeText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedIconButton(() {
                                setState(() {
                                  weight--;
                                });
                              }, Icons.remove),
                              RoundedIconButton(() {
                                setState(() {
                                  weight++;
                                });
                              }, Icons.add),
                            ],
                          )
                        ],
                      ),
                      () => null),
                ),
                Expanded(
                  child: MyCard(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kWidgetSmallText,
                          ),
                          Text(
                            age.toString(),
                            style: kWidgetLargeText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedIconButton(() {
                                setState(() {
                                  age--;
                                });
                              }, Icons.remove),
                              RoundedIconButton(() {
                                setState(() {
                                  age++;
                                });
                              }, Icons.add),
                            ],
                          )
                        ],
                      ),
                      () => null),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                Calculator myCalc = Calculator(height, weight);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: myCalc.calculate(),
                      resultText: myCalc.getResult(),
                      interpretation: myCalc.getInterpretation(),
                    );
                  },
                ));
              },
              child: Container(
                color: kBottomBackgroundColor,
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'CALCULATE',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }
}
