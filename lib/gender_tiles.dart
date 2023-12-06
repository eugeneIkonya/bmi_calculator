import 'package:bmi_calculator/mycard.dart';
import 'package:flutter/material.dart';

class GenderTile extends StatelessWidget {
  final IconData myIcon;
  final String genderName;
  final Color myColor;
  final Function() onTap;

  const GenderTile(
    this.genderName,
    this.myIcon,
    this.myColor,
    this.onTap, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyCard(
          myColor,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                myIcon,
                size: 80,
              ),
              Text(
                genderName,
              )
            ],
          ),
          onTap),
    );
  }
}
