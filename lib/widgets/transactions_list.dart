// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './transactions_list.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTX;
  TransactionList(this.transactions, this.deleteTX);
  // final List<Transactions> _userTransaction = [
  //   Transactions(
  //     id: 't1',
  //     Title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transactions(
  //     id: 't2',
  //     Title: 'Milk',
  //     amount: 65.00,
  //     date: DateTime.now(),
  //   ),
  //   Transactions(
  //     id: 't3',
  //     Title: 'Grocery',
  //     amount: 100.00,
  //     date: DateTime.now(),
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No Transactions added yet !',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                            '\₹${transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].Title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTX(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
