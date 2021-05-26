import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wallpapers extends StatefulWidget {
  @override
  _WallpapersState createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  double _width = 0;
  double _length = 0;
  double _height = 0;
  double wallpapersWidth = 0.53;
  double wallpapersLength = 10;
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
    return ListView(children: [
      Text("Длина комнаты"),
      TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))
        ],
        keyboardType: TextInputType.number,
        onChanged: (s) => {
          setState(() {
            _length = double.tryParse(s) ?? 0;
          })
        },
      ),
      Text("Ширина комнаты"),
      TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))
        ],
        keyboardType: TextInputType.number,
        onChanged: (s) => {
          setState(() {
            _width = double.tryParse(s) ?? 0;
          })
        },
      ),
      Text("Высота комнаты"),
      TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))
        ],
        keyboardType: TextInputType.number,
        onChanged: (s) => {
          setState(() {
            _height = double.tryParse(s ?? "0") ?? 0;
          })
        },
      ),
      Text("Ширина рулона"),
      ListTile(
        title: Text("0.53"),
        leading: Radio(
          value: 0.53,
          groupValue: wallpapersWidth,
          onChanged: (double value) {
            setState(() {
              wallpapersWidth = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("1.06"),
        leading: Radio(
          value: 1.06,
          groupValue: wallpapersWidth,
          onChanged: (double value) {
            setState(() {
              wallpapersWidth = value;
            });
          },
        ),
      ),
      Text("Ширина рулона"),
      ListTile(
        title: Text("10"),
        leading: Radio(
          value: 10.0,
          groupValue: wallpapersLength,
          onChanged: (double value) {
            setState(() {
              wallpapersLength = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("25"),
        leading: Radio(
          value: 25.0,
          groupValue: wallpapersLength,
          onChanged: (double value) {
            setState(() {
              wallpapersLength = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Склейка в стык?"),
        leading: Checkbox(
          value: inJoint,
          onChanged: ((bool value) {
            setState(() {
              inJoint = value;
            });
          }),
        ),
      ),
      Center(
          child: Text(
        "Требуется рулонов",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
      Center(
        child: Text(neededRolls().toString(),
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      )
    ]);
  }
}
