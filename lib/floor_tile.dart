import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FloorTile extends StatefulWidget {
  @override
  _FloorTileState createState() => _FloorTileState();
}

class _FloorTileState extends State<FloorTile> {
  int _floorLength = 0;
  int _floorWidth = 0;
  int _tileLength = 0;
  int _tileWidth = 0;
  int _reserve = 5;

  int _floorSquare() => _floorLength * _floorWidth;

  int _tileSquare() => _tileLength * _tileWidth;

  double _neededTiles() => _tileSquare() != 0
      ? (1 + _reserve / 100) * _floorSquare() / _tileSquare()
      : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Рассчитать плитку для пола'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Длина пола, см"),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
                LengthLimitingTextInputFormatter(4)
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _floorLength = int.parse(value);
                });
              },
            ),
            Text("Ширина пола, см"),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
                LengthLimitingTextInputFormatter(4)
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _floorWidth = int.parse(value);
                });
              },
            ),
            Text("Длина плитки, см"),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
                LengthLimitingTextInputFormatter(3)
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _tileLength = int.parse(value);
                });
              },
            ),
            Text("Ширина плитки, см"),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
                LengthLimitingTextInputFormatter(3)
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _tileWidth = int.parse(value);
                });
              },
            ),
            Text("Запас, %"),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
                LengthLimitingTextInputFormatter(2)
              ],
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: _reserve.toString()),
              onChanged: (value) {
                setState(() {
                  _reserve = int.parse(value);
                });
              },
            ),
            Text("Плиток нужно"),
            Text(_neededTiles().ceil().toString())
          ],
        ),
      ),
    );
  }
}
