import 'package:flutter/material.dart';

class RepairCalculator extends StatelessWidget {
  final String title;
  final Widget child;
  RepairCalculator({this.title, this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
