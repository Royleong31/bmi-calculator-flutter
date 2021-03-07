import 'package:flutter/material.dart';

enum Gender { male, female }
enum Weight { increase, decrease }

const kBottomContainerHeight = 80.0;

const kBottomContainerColor = Color(0xffeb1555);
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);

const kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xff8d8e98),
);

const kLargeTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);

const double defaultHeight = 160;
const double minHeight = 100;
const double maxHeight = 220;

const int defaultWeight = 60;
const int defaultAge = 20;
