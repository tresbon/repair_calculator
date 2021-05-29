import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/calculator_fields.dart';

class Wallpapers extends StatefulWidget {
  @override
  _WallpapersState createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  double _width = 0;
  double _length = 0;
  double _height = 0;
  double wallpapersWidth = 53;
  double wallpapersLength = 1000;
  bool inJoint = false;

  int stripesFromRoll() => (_height != 0 && _width != 0 && _length != 0)
      ? (wallpapersLength / _height - (inJoint ? 1 : 0)).ceil()
      : 0;

  double wallsLength() => 2 * (_width + _length);

  int neededStripes() => (wallsLength() / wallpapersWidth).ceil();

  int neededRolls() =>
      stripesFromRoll() != 0 ? (neededStripes() / stripesFromRoll()).ceil() : 0;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      CalculatorField(
        header: "Длина комнаты, см",
        child: CalculatorInput(
          pattern: RegExp(r"\d"),
          maxLength: 4,
          keyboardType: TextInputType.number,
          onChanged: (s) => {
            setState(() {
              _length = double.tryParse(s) ?? 0;
            } )
          },
        )
      ),
      CalculatorField(
        header: "Ширина комнаты, см",
        child: CalculatorInput(
          pattern: RegExp(r"\d"),
          maxLength: 4,
          keyboardType: TextInputType.number,
          onChanged: (s) => {
            setState(() {
              _width = double.tryParse(s) ?? 0;
            } )
          },
        )
      ),
      CalculatorField(
        header: "Высота комнаты, см",
        child: CalculatorInput(
          pattern: RegExp(r"\d"),
          maxLength: 3,
          keyboardType: TextInputType.number,
          onChanged: (s) => {
            setState(() {
              _height = double.tryParse(s) ?? 0;
            } )
          },
        )
      ),
      CalculatorField(
        header: "Ширина рулона, м",
        child: Column(
          children: [
            CalculatorRadio(
              title: "0.53",
              value: 53.0,
              groupValue: wallpapersWidth,
              onChanged: (double value) {
                setState(() {
                  wallpapersWidth = value;
                });
              },
            ),
            CalculatorRadio(
              title: "1.06",
              value: 106.0,
              groupValue: wallpapersWidth,
              onChanged: (double value) {
                setState(() {
                  wallpapersWidth = value;
                });
              },
            ),
          ],
        ),
      ),
      CalculatorField(
        header: "Длина рулона, м",
        child: Column(
          children: [
            CalculatorRadio(
              title: "10",
              value: 1000.0,
              groupValue: wallpapersLength,
              onChanged: (double value) {
                setState(() {
                  wallpapersLength = value;
                });
              },
            ),
            CalculatorRadio(
              title: "25",
              value: 2500.0,
              groupValue: wallpapersLength,
              onChanged: (double value) {
                setState(() {
                  wallpapersLength = value;
                });
              },
            ),
          ],
        ),
      ),
      CalculatorCheckbox(
        value: inJoint,
        onChanged: (bool value) {
          setState(() {
            inJoint = value;
          });
        },
      ),
      CalculatorResult(
        header: "Требуется рулонов",
        result: neededRolls().toString(),
      ),
    ]);
  }
}
