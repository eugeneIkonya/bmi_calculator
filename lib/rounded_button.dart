import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  const RoundedIconButton(
    this.onPressed,
    this.icon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: kRoundButtonColor,
      constraints: const BoxConstraints.tightFor(
        width: 53,
        height: 56,
      ),
      elevation: 6,
      child: Icon(
        icon,
      ),
    );
  }
}
