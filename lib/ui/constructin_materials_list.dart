import 'package:flutter/cupertino.dart';
import 'package:repair_calculator/calculators/linoleum.dart';
import '../calculators/laminate.dart';
import '../calculators/floor_tile.dart';
import '../calculators/wallpapers.dart';
import '../calculators/walls_tile.dart';
import '../calculators/levering_floor.dart';
import '../calculators/parquet.dart';
import '../calculators/linoleum.dart';

class ConstructionMaterials {
  List<ConcreteMaterial> calculators = [
    ConcreteMaterial(
        title: "Обои для стен",
        calculatorTitle: "Рассчитать обои",
        calculatorPage: Wallpapers()),
    ConcreteMaterial(
        title: "Плитка для пола",
        calculatorTitle: "Рассчитать плитку для пола",
        calculatorPage: FloorTile()),
    ConcreteMaterial(
        title: "Плитка для стен",
        calculatorTitle: "Рассчитать плитку для стен",
        calculatorPage: WallsTile()),
    ConcreteMaterial(
        title: "Ламинат",
        calculatorTitle: "Рассчитать ламинат",
        calculatorPage: Laminate()),
    ConcreteMaterial(
        title: "Наливной пол",
        calculatorTitle: "Рассчитать наливной пол",
        calculatorPage: LeveringFloor()),
    ConcreteMaterial(
        title: "Паркет для пола",
        calculatorTitle: "Рассчитать паркет",
        calculatorPage: Parquet()),
    ConcreteMaterial(
        title: "Линолеум для пола",
        calculatorTitle: "Рассчитать линолеум",
        calculatorPage: Linoleum()),
  ];
}

class ConcreteMaterial {
  final String title;
  final String calculatorTitle;
  final Widget calculatorPage;

  ConcreteMaterial({this.title, this.calculatorTitle, this.calculatorPage});
}
