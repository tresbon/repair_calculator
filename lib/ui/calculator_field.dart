import 'package:flutter/material.dart';

class CalculatorField extends StatelessWidget {
  final String header;
  final Widget child;
  CalculatorField({this.header, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
          style: TextStyle(
            fontSize: 17
          ),),
          child
        ],
      ),
    );
  }
}
