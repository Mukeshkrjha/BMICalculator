import 'package:flutter/material.dart';

class Custom_Card extends StatelessWidget {
  Color color;

  Custom_Card({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
