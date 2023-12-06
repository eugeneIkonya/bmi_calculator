import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color myColor;
  final Widget cardChild;
  final Function() onTap;

  const MyCard(this.myColor, this.cardChild, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: myColor, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
