import 'package:bitcoin_checker/assets/constants.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  CoinCard({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15),
      color: kContentBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: kTextStyle,
        ),
      ),
    );
  }
}
