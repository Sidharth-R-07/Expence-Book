import 'package:expencesbook/Custom_Widgets/add_expences.dart';
import 'package:expencesbook/Custom_Widgets/chart_sheet.dart';
import 'package:expencesbook/Custom_Widgets/expences_list.dart';
import 'package:expencesbook/Provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../Models/transactions_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  final List<Transaction> transactionList = [
    Transaction(
      title: "new shoes",
      amount: 500,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    ),
    Transaction(
      title: "new shoes",
      amount: 500,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   title: "new shoes",
    //   amount: 500,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
  ];

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) => AddExpences());
  }

  // void _addNewTransaction({
  //   required String title,
  //   required double amount,
  //   required DateTime date,
  //   required BuildContext context,
  // }) async {
  //   if (title.isEmpty || amount < 0) {
  //     return;
  //   }

  //   var tx = Transaction(
  //       amount: amount,
  //       date: date,
  //       title: title,
  //       id: DateTime.now().toString());

  //   DbHelper().addToDb(tx);

  //   // setState(() {
  //   //   transactionList.add(tx);

  //   // });

  //   // print(widget.transactionList.value.toString());

  //   Navigator.of(context).pop();
  // }

 

  // void deleteTransaction(String id) {



  //   DbHelper().deleteTransaction(id);
  //   // setState(() {
  //   //   DbHelper.transactionListNotifier.value.removeWhere((item) {
  //   //     return item.id == id;
  //   //   });
  //   //   // print("transaction deleted ${id}");
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
  final txProvider=Provider.of<Transactions>(context);
  txProvider.fetchAllTransactions();
    final appBar = AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          'Expences Book',
          style: TextStyle(fontSize: 26),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              _openBottomSheet(context);
            },
            icon: const Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ),
      ],
    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: isLandscape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.96) -
                            (appBar.preferredSize.height) -
                            MediaQuery.of(context).padding.top,
                        child: ChartSheet(txProvider.recentTransactions)),
                  txProvider.  recentTransactions.isEmpty
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No Transactions yet..! ",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.060,
                                  ),
                                ),
                                SizedBox(
                                  height: (MediaQuery.of(context).size.width *
                                          0.08) -
                                      appBar.preferredSize.height,
                                ),
                                SizedBox(
                                  height: (MediaQuery.of(context).size.width *
                                          0.25) -
                                      appBar.preferredSize.height,
                                  child: Image.asset(
                                    'Assets/Images/waiting.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: (MediaQuery.of(context).size.width * 0.85) -
                                appBar.preferredSize.height,
                            child: const ExpencesList()),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.26) -
                            (appBar.preferredSize.height) -
                            MediaQuery.of(context).padding.top,
                        child: ChartSheet(txProvider.recentTransactions)),
                  txProvider.  recentTransactions.isEmpty
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "No Transactions yet..! ",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: (MediaQuery.of(context).size.height *
                                          0.12) -
                                      appBar.preferredSize.height,
                                ),
                                SizedBox(
                                  height: (MediaQuery.of(context).size.height *
                                          0.40) -
                                      appBar.preferredSize.height,
                                  child: Image.asset(
                                    'Assets/Images/waiting.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height:
                                (MediaQuery.of(context).size.height * 0.78) -
                                    appBar.preferredSize.height,
                            child:const ExpencesList()),
                  ],
                ),
        ),
      ),
      floatingActionButton: isLandscape
          ? FloatingActionButton.extended(
              label: const Text(
                'Add Expences',
                style: TextStyle(fontSize: 16),
              ),
              tooltip: 'Add Expences',
              elevation: 5,
              onPressed: () {
                _openBottomSheet(context);
              },
            )
          : FloatingActionButton(
              tooltip: 'Add Expences',
              elevation: 5,
              onPressed: () {
                _openBottomSheet(context);
              },
              child: const Icon(
                Icons.add,
                size: 34,
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
