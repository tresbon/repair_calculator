import 'package:flutter/material.dart';
import '../utils/db_models.dart';

class PurchaseTile extends StatelessWidget {
  final Purchase purchase;

  PurchaseTile({this.purchase});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            purchase.quantity.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          purchase.type,
          style: TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          purchase.comment,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
