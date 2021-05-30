import 'package:flutter/material.dart';
import 'package:repair_calculator/calculators/floor_tile.dart';
import '../calculators/wallpapers.dart';
import 'calculator.dart';
import '../ui/purchases_list.dart';

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
                          builder: (context) => RepairCalculator(
                                title: 'Рассчитать обои',
                                child: Wallpapers(),
                              )));
                },
                child: Text("Обои")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RepairCalculator(
                                title: 'Рассчитать плитку для пола',
                                child: FloorTile(),
                              )));
                },
                child: Text("Плитка для пола")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PurchasesList()));
                },
                child: Text("Список покупок")),
          ],
        ),
      ),
    );
  }
}
