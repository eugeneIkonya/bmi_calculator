import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                Expanded(
                  child: MyCard(const Color(0xff1d1e33)),
                ),
                Expanded(
                  child: MyCard(const Color(0xff1d1e33)),
                ),
              ],
            )),
            Expanded(child: MyCard(const Color(0xff1d1e33))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyCard(const Color(0xff1d1e33)),
                ),
                Expanded(
                  child: MyCard(const Color(0xff1d1e33)),
                ),
              ],
            )),
          ],
        ));
  }
}

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  Color myColor;

  MyCard(this.myColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: myColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
