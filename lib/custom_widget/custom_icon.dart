import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/util/app_constant.dart';

class CustomIcons extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final String text;

  CustomIcons(
      {@required this.icon, this.size, this.color, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: kTEXT_STYLE,
        )
      ],
    );
  }
}
