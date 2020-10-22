import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/custom_widget/card.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Custom_Card(
                    color: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: Custom_Card(
                    color: Color(0xFF1D1E33),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Custom_Card(
              color: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Custom_Card(
                    color: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: Custom_Card(
                    color: Color(0xFF1D1E33),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
