import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/custom_widget/card.dart';
import 'package:flutter_health_bmi_calculator/custom_widget/custom_bottom_button.dart';
import 'package:flutter_health_bmi_calculator/custom_widget/round_button.dart';
import 'package:flutter_health_bmi_calculator/result.dart';
import 'package:flutter_health_bmi_calculator/util/app_constant.dart';
import 'package:flutter_health_bmi_calculator/util/bmi_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_widget/custom_icon.dart';

enum GENDER { MALE, FEMALE }

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GENDER selectedGender;
  int selectedHeight = 185;
  int selectedWeight = 50;
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GENDER.MALE;
                      });
                    },
                    color: (selectedGender == GENDER.MALE)
                        ? kACTIVE_CARD_COLOR
                        : kIN_ACTIVE_CARD_COLOR,
                    child:
                        CustomIcons(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GENDER.FEMALE;
                      });
                    },
                    color: (selectedGender == GENDER.FEMALE)
                        ? kACTIVE_CARD_COLOR
                        : kIN_ACTIVE_CARD_COLOR,
                    child: CustomIcons(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: kACTIVE_CARD_COLOR,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTEXT_STYLE,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        selectedHeight.toString(),
                        style: kLARGE_TEXT_STYLE,
                      ),
                      Text(
                        'cm',
                        style: kTEXT_STYLE,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSLIDER_ACTIVE_TRACK_COLOR,
                        thumbColor: kSLIDER_THUMB_COLOR,
                        overlayColor: kSLIDER_OVERLAY_COLOR,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      min: kSLIDER_MIN_VALUE,
                      max: kSLIDER_MAX_VALUE,
                      onChanged: (double value) {
                        setState(() {
                          selectedHeight = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomCard(
                    color: kACTIVE_CARD_COLOR,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTEXT_STYLE,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kLARGE_TEXT_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                onPress: () {
                                  setState(() {
                                    if (selectedWeight > 0) selectedWeight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                                color: kFAB_BG),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundButton(
                                onPress: () {
                                  setState(() {
                                    selectedWeight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                                color: kFAB_BG),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: kACTIVE_CARD_COLOR,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTEXT_STYLE,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: kLARGE_TEXT_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                onPress: () {
                                  setState(() {
                                    if (selectedAge > 0) selectedAge--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                                color: kFAB_BG),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundButton(
                                onPress: () {
                                  setState(() {
                                    selectedAge++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                                color: kFAB_BG),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: CustomBottomButton(
              onTap: () {
                BMIBrain brain =
                    BMIBrain(height: selectedHeight, weight: selectedWeight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                            bmiResult: brain.calculateBMI(),
                            bmiResultText: brain.getResult(),
                            bmiInterpretation: brain.getCorelation())));
              },
              buttonText: 'CALCULATE BMI',
            ),
          )
        ],
      ),
    );
  }
}
