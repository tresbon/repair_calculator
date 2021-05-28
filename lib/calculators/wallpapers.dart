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
        child: TextField(
          style: TextStyle(fontSize: 17),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"\d")),
            LengthLimitingTextInputFormatter(4)
          ],
          keyboardType: TextInputType.number,
          onChanged: (s) => {
            setState(() {
              _length = double.tryParse(s) ?? 0;
            })
          },
        ),
      ),
      CalculatorField(
        header: "Ширина комнаты, см",
        child: TextField(
          style: TextStyle(fontSize: 17),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"\d")),
            LengthLimitingTextInputFormatter(4)
          ],
          keyboardType: TextInputType.number,
          onChanged: (s) => {
            setState(() {
              _width = double.tryParse(s) ?? 0;
            })
          },
        ),
      ),
      CalculatorField(
        header: "Высота комнаты, см",
        child: TextField(
          style: TextStyle(fontSize: 17),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"\d"))],
          keyboardType: TextInputType.number,
          onChanged: (s) => {
            setState(() {
              _height = double.tryParse(s ?? "0") ?? 0;
            })
          },
        ),
      ),
      CalculatorField(
        header: "Ширина рулона, м",
        child: Column(
          children: [
            ListTile(
              title: Text(
                "0.53",
                style: TextStyle(fontSize: 17),
              ),
              leading: Radio(
                value: 53.0,
                groupValue: wallpapersWidth,
                onChanged: (double value) {
                  setState(() {
                    wallpapersWidth = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                "1.06",
                style: TextStyle(fontSize: 17),
              ),
              leading: Radio(
                value: 106.0,
                groupValue: wallpapersWidth,
                onChanged: (double value) {
                  setState(() {
                    wallpapersWidth = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      CalculatorField(
        header: "Ширина рулона, м",
        child: Column(
          children: [
            ListTile(
              title: Text(
                "10",
                style: TextStyle(fontSize: 17),
              ),
              leading: Radio(
                value: 1000.0,
                groupValue: wallpapersLength,
                onChanged: (double value) {
                  setState(() {
                    wallpapersLength = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                "25",
                style: TextStyle(fontSize: 17),
              ),
              leading: Radio(
                value: 2500.0,
                groupValue: wallpapersLength,
                onChanged: (double value) {
                  setState(() {
                    wallpapersLength = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      ListTile(
        title: Text(
          "С подгоном по рисунку",
          style: TextStyle(fontSize: 17),
        ),
        leading: Checkbox(
          value: inJoint,
          onChanged: ((bool value) {
            setState(() {
              inJoint = value;
            });
          }),
        ),
      ),
      CalculatorResult(
        header: "Требуется рулонов",
        result: neededRolls().toString(),
      ),
    ]);
  }
}
