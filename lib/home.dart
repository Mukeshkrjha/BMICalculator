import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/custom_widget/card.dart';
import 'package:flutter_health_bmi_calculator/util/app_constant.dart';
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
                  Slider(
                    value: selectedHeight.toDouble(),
                    min: kSLIDER_MIN_VALUE,
                    max: kSLIDER_MAX_VALUE,
                    activeColor: kSLIDER_ACTIVE_COLOR,
                    inactiveColor: kSLIDER_INACTIVE_COLOR,
                    onChanged: (double value) {
                      setState(() {
                        selectedHeight = value.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: kACTIVE_CARD_COLOR,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: kACTIVE_CARD_COLOR,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: kPINK,
            height: kBOTTOM_CONTAINER_HEIGHT,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
