import 'package:flutter/material.dart';
import '../utils/db_models.dart';

class PurchaseTile extends StatelessWidget {
  final Purchase purchase;
  PurchaseTile({this.purchase});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(purchase.quantity.toString()),
        title: Text(purchase.type),
        subtitle: Text(purchase.comment),
      ),
    );
  }
}

