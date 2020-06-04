import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../constants.dart';
import '../Components/reusable_card.dart';
import '../Components/buttom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  final double bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("BMI CALCULATOR", style: TextStyle(color: Color(0xFF8D8E98))),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'RESULTS',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: 220.0,
                          height: 220.0,
                          child: SfRadialGauge(axes: <RadialAxis>[
                            RadialAxis(
                                minimum: 0,
                                maximum: 30,
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                      startValue: 0,
                                      endValue: 18.5,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: 18.5,
                                      endValue: 25,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: 25,
                                      endValue: 30,
                                      color: Colors.red)
                                ],
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      value: bmiResult, needleEndWidth: 5)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Column(
                                        children: <Widget>[
                                          Container(
                                              child: Text(
                                                  bmiResult.toStringAsFixed(1),
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Color(0xFFf8c130),
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              child: Text(resultText,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFFf8c130),
                                                  ))),
                                        ],
                                      ),
                                      angle: 90,
                                      positionFactor: 0.9)
                                ])
                          ])),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Center(
                          child: Text(
                            interpretation,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              lable: 'CALCULATE AGAIN',
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
