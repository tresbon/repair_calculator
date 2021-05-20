import 'package:flutter/material.dart';
import 'package:repair_calculator/main_scaffold.dart';
import 'main_scaffold.dart';

void main() {
  runApp(RepairCalculator());
}

class RepairCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор ремонта',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScaffold()
    );
  }
}
