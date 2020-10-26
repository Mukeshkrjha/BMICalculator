import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/util/app_constant.dart';

class CustomBottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  CustomBottomButton({@required this.onTap, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPINK,
        height: kBOTTOM_CONTAINER_HEIGHT,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
