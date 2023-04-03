import 'package:expencesbook/Custom_Widgets/chart_bar.dart';
import 'package:expencesbook/Models/transactions_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartSheet extends StatelessWidget {
  final List<Transaction> recentTransactons;

  ChartSheet(this.recentTransactons);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;
      for (var i = 0; i < recentTransactons.length; i++) {
        if (recentTransactons[i].date.day == weekday.day &&
            recentTransactons[i].date.month == weekday.month &&
            recentTransactons[i].date.year == weekday.year) {
          totalSum = (recentTransactons[i].amount as double) + totalSum;
        }
      }
      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  double get weeklExpences {
    return recentTransactons.fold(0.0, (sum, tx) {
      return sum + tx.amount as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape
        ? Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactions.map((data) {
                  return ChartBar(
                    data['day'] as String,
                    data['amount'] as double,
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  );
                }).toList(),
                // ),
                // const SizedBox(
                //   height: 6,
                // ),
                // Row(
                //   children: [
                //     const Text(
                //       "  Last 7 days expences   :  ",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     Text(
                //       " ₹ ${weeklExpences.toStringAsFixed(2)} ",
                //       style: TextStyle(
                //           fontSize: 24, fontWeight: FontWeight.bold),
                //     ),
                //   ],
              ),
            ),
          )
        : Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.aspectRatio * 0.001),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: groupedTransactions.map((data) {
                      return ChartBar(
                        data['day'] as String,
                        data['amount'] as double,
                        totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      const Text(
                        "  Last 7 days expences   :  ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        " ₹ ${weeklExpences.toStringAsFixed(2)} ",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
