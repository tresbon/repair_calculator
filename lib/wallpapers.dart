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
  TextEditingController _widthController = TextEditingController(text: "0");
  TextEditingController _heightController = TextEditingController(text: "0");
  TextEditingController _lengthController = TextEditingController(text: "0");
  double wallpapersWidth = 0.53;
  double wallpapersLength = 10;
  double result;
  bool inJoint = false;

  String getWallsSquare(double width, double length, double height) =>
      (2 * (width + length) * height).toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Рассчитать обои"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Длина"),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))],
              keyboardType: TextInputType.number,
              onChanged: (s) => {
                setState(() {_length = double.tryParse(s) ?? 0;})
              },
            ),
            Text("Ширина"),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))],
              keyboardType: TextInputType.number,
              onChanged: (s) => {
                setState(() {
                  _width = double.tryParse(s) ?? 0;})
              },
            ),
            Text("Высота"),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))],
              keyboardType: TextInputType.number,
              onChanged: (s) => {
                setState(() {_height = double.tryParse(s ?? "0") ?? 0;})
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
                onChanged: (
                    (bool value) {
                      setState(() {
                        inJoint = value;
                      });
                    }
                ),
              ),
            )
            Text("Площадь стен"),
            Center(
              child: Text(getWallsSquare(_width,_length,_height)),
            )
          ],
        ),
      ),
    );
  }
}
