import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/calculator_fields.dart';

class FloorTile extends StatefulWidget {
  @override
  _FloorTileState createState() => _FloorTileState();
}

class _FloorTileState extends State<FloorTile> {
  int _floorLength = 0;
  int _floorWidth = 0;
  int _tileLength = 0;
  int _tileWidth = 0;
  int _reserve = 0;

  int _floorSquare() => _floorLength * _floorWidth;

  int _tileSquare() => _tileLength * _tileWidth;

  double _neededTiles() => _tileSquare() != 0
      ? (1 + _reserve / 100) * _floorSquare() / _tileSquare()
      : 0;

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
            header: "Длина плитки, см",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 3,
                keyboardType: TextInputType.number,
                controllerText: _tileLength.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _tileLength = int.parse(value);
                    },
                  );
                })),
        CalculatorField(
            header: "Ширина плитки, см",
            child: CalculatorInput(
                pattern: RegExp(r"\d"),
                maxLength: 3,
                keyboardType: TextInputType.number,
                controllerText: _tileWidth.toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _tileWidth = int.parse(value);
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
          header: "Плиток нужно",
          result: _neededTiles().ceil().toString(),
        ),
        HowCounted(
          countExplanation: """
          Площадь пола делится на площадь одной плитки
          Результат умножается на запас
          Запас по умолчанию равен нулю
          """,
        ),
        AddToPurchasesButton(
          type:
              "${conjugateNumber(_neededTiles().ceil(), "Плитка", "Плитки", "Плиток")} для пола ${(_floorSquare()/100).ceil()}м^2",
          quantity: _neededTiles().ceil(),
        ),
      ],
    );
  }
}
