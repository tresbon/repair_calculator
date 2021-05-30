import 'package:flutter/material.dart';
import 'package:repair_calculator/utils/db_models.dart';
import '../utils/db_helper.dart';
import 'purchase_tile.dart';

class PurchasesList extends StatefulWidget {
  @override
  _PurchasesListState createState() => _PurchasesListState();
}

class _PurchasesListState extends State<PurchasesList> {
  DB db = DB();
  List<Purchase> purchasesList;

  @override
  Widget build(BuildContext context) {
    loadPurchases();
    return Scaffold(
      appBar: AppBar(
        title: Text("Список покупок"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: (ListView.builder(
            itemCount: purchasesList.length == null ? 0: purchasesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key("${purchasesList[index].id}${purchasesList[index].type}"),
                onDismissed: (direction) {
                  db.deletePurchase(purchasesList[index]);
                  setState(() {
                    purchasesList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Покупка удалена из списка"),
                  ));
                },
                child: PurchaseTile(
                  purchase: purchasesList[index],
                ),
              );
            })),
      ),
    );
  }

  Future loadPurchases() async {
    await db.openDb();
    purchasesList = await db.getPurchases();
    setState(() {
      purchasesList = purchasesList;
    });
  }
}
