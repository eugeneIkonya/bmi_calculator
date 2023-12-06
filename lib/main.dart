import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: const Color(0xff0A0E21),
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: const Color(0xff0A0E21),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          color: Color.fromARGB(255, 250, 250, 250),
          fontSize: 18.0,
        )),
      ),
      home: const InputPage(),
    );
  }
}
