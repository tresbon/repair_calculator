import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/calculator_fields.dart';

class Linoleum extends StatefulWidget {
  @override
  _LinoleumState createState() => _LinoleumState();
}

class _LinoleumState extends State<Linoleum> {
  int _floorLength = 0;
  int _floorWidth = 0;
  int _rollWidth = 120;
  int _reserve = 5;
  int _joinStep = 0;

  int _floorSquare() => _floorLength * _floorWidth;

  int _neededRolls() => _rollWidth > 0 ? _floorWidth / _rollWidth : 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CalculatorField(
            header: "Длина пола, см",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 4,
                keyboardType: TextInputType.number,
                controllerText: _floorLength.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _floorLength = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Ширина пола, см",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 4,
                keyboardType: TextInputType.number,
                controllerText: _floorWidth.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _floorWidth = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Ширина рулона, см",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 3,
                keyboardType: TextInputType.number,
                controllerText: _rollWidth.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _rollWidth = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Шаг рисунка, см",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 2,
                keyboardType: TextInputType.number,
                controllerText: _joinStep.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _joinStep = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Запас, %",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 2,
                keyboardType: TextInputType.number,
                controllerText: _reserve.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _reserve = int.parse(value);
                    },
                  );
                })),
        CalculatorResult(
          header: "Панелей нужно",
          result: _neededRolls().ceil().toString(),
        ),
        HowCounted(
          countExplanation: """
          Ширина комнаты делится на ширину рулона
          Длина отрезка равна длине комнаты
          Если выбран шаг рисунка, он прибавляется к каждому куску линолеума
          """,
        ),
        AddToPurchasesButton(
          type:
              "${conjugateNumber(_neededRolls().ceil(), "Отрезок", "Отрезка", "Отрезков")} линолеума по ${_floorWidth + _joinStep} см площадь ${(_floorSquare() / 100).ceil()}м^2",
          quantity: _neededRolls().ceil(),
        ),
      ],
    );
  }
}
