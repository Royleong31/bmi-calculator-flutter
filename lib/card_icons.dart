import 'package:flutter/material.dart';
import './constants.dart';

class CardIcons extends StatelessWidget {
  final iconName;
  final String cardLabel;

  CardIcons({this.iconName, this.cardLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconName, size: 80),
        SizedBox(height: 15),
        Text(cardLabel,
            style: kLabelTextStyle)
      ],
    );
  }
}
