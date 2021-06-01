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
  double _wallpapersWidth = 53;
  double _wallpapersLength = 1000;
  bool _inJoint = false;

  int _stripesFromRoll() => (_height != 0 && _width != 0 && _length != 0)
      ? (_wallpapersLength / _height - (_inJoint ? 1 : 0)).ceil()
      : 0;

  double _wallsLength() => 2 * (_width + _length);

  int _neededStripes() => (_wallsLength() / _wallpapersWidth).ceil();

  int _neededRolls() =>
      _stripesFromRoll() != 0 ? (_neededStripes() / _stripesFromRoll()).ceil() : 0;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      CalculatorField(
        header: "Длина комнаты, см",
        child: CalculatorInput(
          pattern: RegExp(r"\d"),
          maxLength: 4,
          keyboardType: TextInputType.number,
          controllerText: _length.toString(),
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
          controllerText: _width.toString(),
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
          controllerText: _height.toString(),
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
              groupValue: _wallpapersWidth,
              onChanged: (double value) {
                setState(() {
                  _wallpapersWidth = value;
                });
              },
            ),
            CalculatorRadio(
              title: "1.06",
              value: 106.0,
              groupValue: _wallpapersWidth,
              onChanged: (double value) {
                setState(() {
                  _wallpapersWidth = value;
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
              groupValue: _wallpapersLength,
              onChanged: (double value) {
                setState(() {
                  _wallpapersLength = value;
                });
              },
            ),
            CalculatorRadio(
              title: "25",
              value: 2500.0,
              groupValue: _wallpapersLength,
              onChanged: (double value) {
                setState(() {
                  _wallpapersLength = value;
                });
              },
            ),
          ],
        ),
      ),
      CalculatorCheckbox(
        value: _inJoint,
        onChanged: (bool value) {
          setState(() {
            _inJoint = value;
          });
        },
      ),
      CalculatorResult(
        header: "Требуется рулонов",
        result: _neededRolls().toString(),
      ),
      HowCounted(
        countExplanation: """
        Длина стен делится на ширину обоев - получаем количество полос
        
        Количество полос делится на высоту потолка - получаем количество рулонов
        
        При склейке с подгоном по рисунку с каждого рулона будет на одну полосу меньше
        
        Окна и двери не учитываются
        """,
      ),
      AddToPurchasesButton(
        type: "${conjugateNumber(_neededRolls(), "Рулон", "Рулона", "Рулонов")} обоев ${(_wallsLength() / 100 * _height / 100).ceil()}м^2",
        quantity: _neededRolls(),
      )
    ]);
  }
}
