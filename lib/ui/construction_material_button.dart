import 'package:flutter/material.dart';
import 'calculator.dart';

class ConstructionMaterialButton extends StatelessWidget {
  final String calculatorTitle;
  final String title;
  final Widget calculatorPage;

  ConstructionMaterialButton(
      {this.title, this.calculatorTitle, this.calculatorPage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RepairCalculator(
                        title: calculatorTitle,
                        child: calculatorPage,
                      )));
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 17),
        ));
  }
}
