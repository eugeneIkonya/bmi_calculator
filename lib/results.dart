import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/mycard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Results Page',
              style: kWidgetMediumText,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: MyCard(
                  kActiveCardColor,
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          resultText,
                          style: kWidgetSmallText,
                        ),
                        Text(
                          bmiResult,
                          style: const TextStyle(
                              fontSize: 100, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                        )
                      ]),
                  () => null)),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const InputPage();
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
                'RE-CALCULATE',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
