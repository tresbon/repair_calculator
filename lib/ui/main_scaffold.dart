import 'package:flutter/material.dart';
import '../ui/purchases_list.dart';
import 'construction_material_button.dart';
import 'constructin_materials_list.dart';

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final List<ConcreteMaterial> _materials = ConstructionMaterials().calculators;

  List<ConcreteMaterial> _searchResults = [];

  List<ConcreteMaterial> _filteredMaterials = [];

  void initState() {
    _filteredMaterials = _materials;
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text(
              "Меню",
              style: TextStyle(
                fontSize: 17
              ),
            )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PurchasesList()));
                },
                child: Text("Список покупок",
                style: TextStyle(
                  fontSize: 17
                ),))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Выберите материал"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView(
          children: [
            TextField(
              controller: _controller,
              onChanged: (s) {
                _searchResults.clear();

                if (s.isEmpty) {
                  setState(() {
                    _filteredMaterials = _materials;
                  });
                }

                _materials.forEach((element) {
                  if (element.title.toLowerCase().contains(s)) {
                    _searchResults.add(element);
                  }
                });

                setState(() {
                  _filteredMaterials = _searchResults;
                });
              },
            ),
            ListView.builder(
                itemCount: _filteredMaterials.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ConstructionMaterialButton(
                    title: _filteredMaterials[index].title,
                    calculatorTitle: _filteredMaterials[index].calculatorTitle,
                    calculatorPage: _filteredMaterials[index].calculatorPage,
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PurchasesList()));
                },
                child: Text(
                  "Список покупок",
                  style: TextStyle(fontSize: 17),
                )),
          ],
        ),
      ),
    );
  }
}
