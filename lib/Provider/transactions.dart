import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Models/transactions_model.dart';

class Transactions with ChangeNotifier {
 var dbBox = Hive.box<Transaction>('myBox');
  List<Transaction> _txList = [];

  List<Transaction> get txList => [..._txList];

  addTransaction(Transaction tx)async{

   await dbBox.put(tx.id, tx);
   _txList.add(tx);
   notifyListeners();
   print('Transaction added successfully');

  }

  fetchAllTransactions()async{
_txList=[];

    _txList.addAll(dbBox.values);
  
    print('Fetched transaction');
  }

  deletTransaction(String key)async{
   await dbBox.delete(key);
   notifyListeners();
   fetchAllTransactions();
   print('Delet transaction successFull');
  }


   List<Transaction> get recentTransactions {
    return _txList.where((data) {
      return data.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
}
