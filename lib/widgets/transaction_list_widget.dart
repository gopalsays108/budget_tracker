import 'package:budget_tracker/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transactions>? userTransactions;

  TransactionListWidget(this.userTransactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: userTransactions!.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction',
                  style: Theme.of(context).appBarTheme.toolbarTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 300,
                  child: Image.asset('assest/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                              '\$${userTransactions!.elementAt(index).amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactions!.elementAt(index).title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(userTransactions!.elementAt(index).dateTime),
                    ),
                    trailing: Text(''),
                  ),
                );
              },
              itemCount: userTransactions!.length,
            ),
    );
  }
}

/**
    Card(
    margin: EdgeInsets.only(left: 12, right: 12, top: 18),
    elevation: 9,
    child: Row(
    children: [
    Container(
    child: Text(
    '\$${userTransactions!.elementAt(index).amount.toStringAsFixed(2)}',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Theme.of(context).primaryColor,
    ),
    ),
    margin: EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
    ),
    decoration: BoxDecoration(
    border: Border.all(
    color: Theme.of(context).primary  Color,
    width: 1.5,
    ),
    ),
    padding: EdgeInsets.all(10),
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    userTransactions!.elementAt(index).title,
    style:
    Theme.of(context).appBarTheme.toolbarTextStyle,
    ),
    Text(
    DateFormat.yMMMd().format(
    userTransactions!.elementAt(index).dateTime),
    style:
    TextStyle(color: Colors.blueGrey, fontSize: 14),
    ),
    ],
    )
    ],
    ),
    );

 */
/**
    @override
    Widget build(BuildContext context) {
    return Container(
    height: 500,
    child: ListView.builder(
    itemBuilder: (BuildContext ctx, int index){
    return null;
    },
    itemCount: userTransactions!.length,
    children: userTransactions!.map((tx) {
    return
    Card(
    margin: EdgeInsets.only(left: 12, right: 12, top: 18),
    elevation: 9,
    child: Row(
    children: [
    Container(
    child: Text(
    '\$${tx.amount}',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.purple,
    ),
    ),
    margin: EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
    ),
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.purple,
    width: 1.5,
    )),
    padding: EdgeInsets.all(10),
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    tx.title,
    style:
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    Text(
    DateFormat.yMMMd().format(tx.dateTime),
    style: TextStyle(color: Colors.blueGrey, fontSize: 14),
    ),
    ],
    )
    ],
    ),
    );
    }).toList(),
    ),
    );
    }


 */
