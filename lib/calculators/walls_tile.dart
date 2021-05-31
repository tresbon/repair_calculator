import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/calculator_fields.dart';

class WallsTile extends StatefulWidget {
  @override
  _WallsTilesState createState() => _WallsTilesState();
}

class _WallsTilesState extends State<WallsTile> {
  int _width = 0;
  int _length = 0;
  int _height = 0;
  int _tileWidth = 0;
  int _tileLength = 0;
  int _reserve = 0;

  int wallsLength() => 2 * (_width + _length);

  int ceilSquare() => _tileLength * _tileWidth;

  int neededTiles() => ceilSquare() > 0
      ? (((100 + _reserve)/100) * wallsLength() * _height / ceilSquare()).ceil()
      : 0;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      CalculatorField(
          header: "Длина комнаты, см",
          child: CalculatorInput(
            pattern: RegExp(r"\d"),
            maxLength: 4,
            keyboardType: TextInputType.number,
            onChanged: (s)  {
              setState(() {
                _length = int.tryParse(s) ?? 0;
              });
              print(_tileWidth);
              print(_tileLength);
            },
          )),
      CalculatorField(
          header: "Ширина комнаты, см",
          child: CalculatorInput(
            pattern: RegExp(r"\d"),
            maxLength: 4,
            keyboardType: TextInputType.number,
            onChanged: (s) => {
              setState(() {
                _width = int.tryParse(s) ?? 0;
              })
            },
          )),
      CalculatorField(
          header: "Высота комнаты, см",
          child: CalculatorInput(
            pattern: RegExp(r"\d"),
            maxLength: 3,
            keyboardType: TextInputType.number,
            onChanged: (s) => {
              setState(() {
                _height = int.tryParse(s) ?? 0;
              })
            },
          )),
      CalculatorField(
          header: "Длина плитки, см",
          child: CalculatorInput(
            pattern: RegExp(r"\d"),
            maxLength: 3,
            keyboardType: TextInputType.number,
            onChanged: (s) => {
              setState(() {
                _tileLength = int.tryParse(s) ?? 0;
              })
            },
          )),
      CalculatorField(
          header: "Ширина плитки, см",
          child: CalculatorInput(
            pattern: RegExp(r"\d"),
            maxLength: 3,
            keyboardType: TextInputType.number,
            onChanged: (s) => {
              setState(() {
                _tileWidth = int.tryParse(s) ?? 0;
              })
            },
          )),
      CalculatorField(
          header: "Запас, %",
          child: CalculatorInput(
            pattern: RegExp(r"\d"),
            maxLength: 2,
            keyboardType: TextInputType.number,
            onChanged: (s) => {
              setState(() {
                _reserve = int.tryParse(s) ?? 0;
              })
            },
          )),
      CalculatorResult(
        header: "Требуется плиток",
        result: neededTiles().toString(),
      ),
      HowCounted(
        countExplanation: """
        Периметр умножается на высоту стен
        Площадь стен делится на площадь одной плитки
        По умолчанию запас равен нулю
        """,
      ),
      AddToPurchasesButton(
        type:
            "${conjugateNumber(neededTiles(), "Плитка", "Плитки", "Плиток")} ${(wallsLength() / 100 * _height / 100).ceil()} м^2",
        quantity: neededTiles(),
      )
    ]);
  }
}
