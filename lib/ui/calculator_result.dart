import 'package:flutter/material.dart';

class CalculatorResult extends StatelessWidget {
  final String header;
  final String result;

  CalculatorResult({this.header, this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          header,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        Center(
          child: Text(result,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
