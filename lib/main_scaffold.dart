import 'package:flutter/material.dart';
import 'package:repair_calculator/floor_tile.dart';
import 'wallpapers.dart';

class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Выберите материал"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wallpapers()));
                },
                child: Text("Обои")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FloorTile()));
                },
                child: Text("Плитка для пола")),
          ],
        ),
      ),
    );
  }
}
