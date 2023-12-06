import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/gender_tiles.dart';
import 'package:bmi_calculator/mycard.dart';
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
                  kInactiveCardColor,
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
                              style: widgetLargeText,
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
                            activeColor: Colors.white,
                            inactiveColor: const Color(0xffBD8E98),
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
            Container(
              color: kBottomBackgroundColor,
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.only(top: 10),
            )
          ],
        ));
  }
}
