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
  double result;

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
              controller: _lengthController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))],
              keyboardType: TextInputType.number,
              onChanged: (s) => {
                setState(() {_length = double.tryParse(s ?? "0");})
              },
            ),
            Text("Ширина"),
            TextField(
              controller: _widthController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))],
              keyboardType: TextInputType.number,
              onChanged: (s) => {
                setState(() {
                  String text = s ?? "0";
                  _width = double.tryParse(text);})
              },
            ),
            Text("Высота"),
            TextField(
              controller: _heightController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^(\d){0,1}(\.){0,1}(\d){0,2}$"))],
              keyboardType: TextInputType.number,
              onChanged: (s) => {
                setState(() {_height = double.tryParse(s ?? "0");})
              },
            ),
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
