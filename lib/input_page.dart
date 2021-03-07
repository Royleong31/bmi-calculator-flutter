import 'package:flutter/material.dart';
import './reusable_card.dart';
import './constants.dart';
import './card_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender previousGender;
  int height = defaultHeight.toInt();
  int weight = defaultWeight;
  int age = defaultAge;

  void tapHandler(Gender currentGender) {
    setState(() {
      if (previousGender == currentGender) {
        previousGender = null;
        return;
      }
      previousGender = currentGender;
    });
  }

  void weightHandler(Weight change) {
    setState(() {
      if (change == Weight.increase && weight < 140) {
        weight++;
      } else if (change == Weight.decrease && weight > 20) {
        weight--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  colour: (previousGender == Gender.male)
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: CardIcons(
                    iconName: FontAwesomeIcons.mars,
                    cardLabel: 'Male',
                  ),
                  tapHandler: () => tapHandler(Gender.male),
                ),
                ReusableCard(
                  colour: (previousGender == Gender.female)
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: CardIcons(
                    iconName: FontAwesomeIcons.venus,
                    cardLabel: 'Female',
                  ),
                  tapHandler: () => tapHandler(Gender.female),
                ),
              ],
            ),
          ),
          ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kLargeTextStyle),
                    Text('cm', style: kLabelTextStyle)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      overlayColor: Color(0x29eb1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey[500],
                      thumbColor: kBottomContainerColor),
                  child: Slider(
                    value: height.toDouble(),
                    min: minHeight,
                    max: maxHeight,
                    onChanged: (double newVal) {
                      setState(() {
                        height = newVal.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Weight', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(weight.toString(), style: kLargeTextStyle),
                          Text('kg', style: kLabelTextStyle)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              tapHandler: () => weightHandler(Weight.increase)),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              tapHandler: () => weightHandler(Weight.decrease))
                        ],
                      )
                    ],
                  ),
                ),
                ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Age', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(age.toString(), style: kLargeTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              tapHandler: () => setState(() {
                                    if (age < 120) age++;
                                  })),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              tapHandler: () => setState(() {
                                    if (age > 1) age--;
                                  }))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0)),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function tapHandler;
  RoundIconButton({@required this.icon, @required this.tapHandler});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      onPressed: tapHandler,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
