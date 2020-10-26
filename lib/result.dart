import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/custom_widget/card.dart';
import 'package:flutter_health_bmi_calculator/util/app_constant.dart';

import 'custom_widget/custom_bottom_button.dart';
import 'home.dart';

class Result extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;
  final String bmiInterpretation;

  Result(
      {@required this.bmiResult,
      @required this.bmiResultText,
      this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAPP_NAME),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Your Result',
                      style: kMEDIUM_TEXT_STYLE,
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: CustomCard(
                      color: kACTIVE_CARD_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            bmiResultText,
                            textAlign: TextAlign.center,
                            style: kRESULT_TEXT_STYLE,
                          ),
                          Text(
                            bmiResult,
                            textAlign: TextAlign.center,
                            style: kBMI_TEXT_STYLE,
                          ),
                          Column(
                            children: [
                              Text(
                                'Normal BMI Range:',
                                textAlign: TextAlign.center,
                                style: kBMI_INFO_TEXT_TITLE_STYLE,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '18.5 - 25 kg/m2',
                                textAlign: TextAlign.center,
                                style: kBMI_INFO_TEXT_STYLE,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              bmiInterpretation,
                              textAlign: TextAlign.center,
                              style: kBMI_INFO_TEXT_STYLE,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SafeArea(
            child: CustomBottomButton(
              onTap: () => {Navigator.pop(context)},
              buttonText: 'RE-CALCULATE BMI',
            ),
          )
        ],
      ),
    );
  }
}
