import 'package:flutter/cupertino.dart';

import '../calculators/laminate.dart';
import '../calculators/floor_tile.dart';
import '../calculators/wallpapers.dart';
import '../calculators/walls_tile.dart';

class ConstructionMaterials {
  List<ConcreteMaterial> calculators = [
    ConcreteMaterial(
      title: "Обои",
      calculatorTitle: "Рассчитать обои",
      calculatorPage: Wallpapers()
    ),
    ConcreteMaterial(
        title: "Плитка для пола",
        calculatorTitle: "Рассчитать плитку для пола",
        calculatorPage: FloorTile()
    ),
    ConcreteMaterial(
        title: "Плитка для стен",
        calculatorTitle: "Рассчитать плитку для стен",
        calculatorPage: WallsTile()
    ),
    ConcreteMaterial(
        title: "Ламинат",
        calculatorTitle: "Рассчитать ламинат",
        calculatorPage: Laminate()
    ),
  ];
}

class ConcreteMaterial {
  final String title;
  final String calculatorTitle;
  final Widget calculatorPage;
  ConcreteMaterial({this.title, this.calculatorTitle, this.calculatorPage});
}