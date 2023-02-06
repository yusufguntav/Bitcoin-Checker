import 'package:bitcoin_checker/assets/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.label, required this.onPress});
  String label;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: kContentBackgroundColor, elevation: 7),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          label,
          style: kTextStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
