import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/calculator_fields.dart';

class LeveringFloor extends StatefulWidget {
  @override
  _LeveringFloorState createState() => _LeveringFloorState();
}

class _LeveringFloorState extends State<LeveringFloor> {
  int _floorLength = 0;
  int _floorWidth = 0;
  int _height = 0;
  int _heightDifference = 0;
  double _mixtureDensity = 1.5;

  double _neededSacs() => (_floorWidth * _floorLength) * (_height + _heightDifference/2) * _mixtureDensity;

  int _floorSquare() => _floorLength * _floorWidth;

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
            header: "Выоста заливки, мм",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 3,
                keyboardType: TextInputType.number,
                controllerText: _height.toString(),
                onChanged: (value) {
                  setState(
                        () {
                          _height = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Перепад высот, мм",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 3,
                keyboardType: TextInputType.number,
                controllerText: _heightDifference.toString(),
                onChanged: (value) {
                  setState(
                        () {
                          _heightDifference = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Плотность смеси кг/м2/мм",
            child: CalculatorInput(
                pattern: RegExp(r"\d{1}(\.\d{1}){1}"),
                maxLength: 2,
                keyboardType: TextInputType.number,
                controllerText: _mixtureDensity.toString(),
                onChanged: (value) {
                  setState(
                        () {
                          _mixtureDensity = double.parse(value);
                    },
                  );
                })),
        CalculatorResult(
          header: "Мешков нужно",
          result: _neededSacs().ceil().toString(),
        ),
        HowCounted(
          countExplanation: """
          Площадь пола умножается на высоту пола
          При перепаде высот прибавляется произведение площади пола на перепад делёное на 2
          Результат умножается на площадь смеси
          """,
        ),
        AddToPurchasesButton(
          type:
          "${conjugateNumber(_neededSacs().ceil(), "Мешок", "Мешка", "Мешков")} наливного пола ${(_floorSquare()/100).ceil()}м^2",
          quantity: _neededSacs().ceil(),
        ),
      ],
    );
  }
}
