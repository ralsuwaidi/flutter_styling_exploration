import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.deleteTransaction,
    @required this.transaction,
  }) : super(key: key);

  final Function deleteTransaction;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().toString()),
      // delete when swipe away
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        deleteTransaction(transaction.id);
      },
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListTile(
          title: Text(
            transaction.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            DateFormat.MMMMd().format(transaction.date),
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          trailing: Text(
            transaction.amount.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
