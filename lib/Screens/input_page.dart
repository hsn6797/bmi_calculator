import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/gender_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../Components/buttom_button.dart';
import '../Components/round_icon.dart';
import '../Data/bmi_brain.dart';

enum Gender { male, female }
int height = 160;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Color(0xFF8D8E98),
          ),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderContent(
                        icon: FontAwesomeIcons.mars,
                        lable: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderContent(
                        icon: FontAwesomeIcons.venus,
                        lable: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "cm",
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFf8c130),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29f8c130),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFf8c130),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                colour: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundIcon(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLableTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIcon(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                lable: 'CALCULATE',
                onTap: () {
                  BMIBrain bb = BMIBrain(weight: weight, height: height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: bb.CalculateBMI(),
                        resultText: bb.getResult(),
                        interpretation: bb.getInterpretation(),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
