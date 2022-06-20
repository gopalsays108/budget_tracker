import 'package:budget_tracker/model/transactions.dart';
import 'package:budget_tracker/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';

import 'new_transaction_widget.dart';

class UserTransactionWidget extends StatefulWidget {
  const UserTransactionWidget({Key? key}) : super(key: key);

  @override
  _UserTransactionWidgetState createState() => _UserTransactionWidgetState();
}

class _UserTransactionWidgetState extends State<UserTransactionWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTransactionWidget(_addNewTransaction),
        // TransactionListWidget(_userTransactions),
      ],
    );
  }
}
