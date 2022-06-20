import 'package:budget_tracker/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class ChartWidget extends StatelessWidget {
  final List<Transactions> recentTrans;

  ChartWidget(this.recentTrans, {Key? key}) : super(key: key);

  /// Getter
  List<Map<String, Object>> get groupTransactionValues {
    /// 0 to 6
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (int i = 0; i < recentTrans.length; i++) {
        if (recentTrans[i].dateTime.day == weekDay.day &&
            recentTrans[i].dateTime.month == weekDay.month &&
            recentTrans[i].dateTime.year == weekDay.year) {
          totalSum += recentTrans[i].amount;
        }
      }

      return {
        ///E just return the shirt hand for day
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  double get maxSpending {
    return groupTransactionValues.fold(0.0, (previousValue, element) {
      if (element['amount'] != null) {
        return previousValue + double.parse(element['amount'].toString());
      } else {
        return 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
      elevation: 6,
      margin: const   EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupTransactionValues.map((data) {
            return Flexible(  /// We can use Expanded widget instead of Flexible with tight
              fit: FlexFit.tight,
              child: CharBar(
                  label: data['day'].toString(),
                  spendingAmount: (data['amount'] as double),
                  spendingPctOfTotal: maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
