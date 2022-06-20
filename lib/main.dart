// import 'package:budget_tracker/transactions.dart';

import 'package:budget_tracker/string/string.dart';
import 'package:budget_tracker/widgets/chart_widget.dart';
import 'package:budget_tracker/widgets/new_transaction_widget.dart';
import 'package:budget_tracker/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'model/transactions.dart';

void main() {
  runApp(MyApp());
}

final Strings str = Strings();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: str.appName(),
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(secondary: Colors.amber),
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          toolbarTextStyle: TextStyle(
              fontFamily: 'QuickSans',
              fontWeight: FontWeight.bold,
              fontSize: 18),
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String? titleInput;

  final List<Transactions> _userTransactions = [
    // Transactions(
    //   id: "t1",
    //   title: "Shoes",
    //   amount: 12.0,
    //   dateTime: DateTime.now(),
    // ),
    // Transactions(
    //   id: "t2",
    //   title: "Shirt",
    //   amount: 45.0,
    //   dateTime: DateTime.now(),
    // )
  ];

  List<Transactions> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      dateTime: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransactionWidget(_addNewTransaction),
            behavior: HitTestBehavior
                .opaque, //not needed, we added this to just stop closing
            // bottom sheet when tapped on it
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(str.titleName()),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChartWidget(_recentTransaction),
            TransactionListWidget(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
