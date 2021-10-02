import 'package:flutter/material.dart';
import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/empty.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              )
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  deleteTransaction: deleteTransaction,
                  transaction: transactions[index]);
            },
            itemCount: transactions.length,
          );
  }
}
