
import 'package:expencesbook/Provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpencesList extends StatelessWidget {

  const ExpencesList({super.key});

  @override
  Widget build(BuildContext context) {
    final txProvider = Provider.of<Transactions>(context);

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape
        ? ListView.builder(
            itemCount: txProvider.txList.length,
            itemBuilder: (context, index) {
              final _tx = txProvider.txList[index];
              return Card(
                child: ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                "₹ ${_tx.amount.toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        _tx.title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(DateFormat('dd-MM-yyyy').format(_tx.date)),
                  ),
                  trailing: TextButton.icon(
                      label: Text(
                        'Delete',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () {
                        txProvider.deletTransaction(_tx.id);
                      }),
                ),
              );
            })
        : ListView.builder(
            itemCount: txProvider.txList.length,
            itemBuilder: (context, index) {
              final _tx = txProvider.txList[index];

              return Card(
                child: ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                "₹ ${_tx.amount.toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        _tx.title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(DateFormat('dd-MM-yyyy').format(_tx.date)),
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () {
                        txProvider.deletTransaction(_tx.id);
                      }),
                ),
              );
            });
  }
}
