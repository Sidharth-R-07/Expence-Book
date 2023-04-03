import 'package:expencesbook/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hive_flutter/adapters.dart';

import 'Models/transactions_model.dart';
import 'Provider/transactions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(TransactionAdapter().typeId)) {
    Hive.registerAdapter(TransactionAdapter());
  }

  await Hive.openBox<Transaction>('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expences Book App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.black26,
        ),
        home: HomePage(),
      ),
    );
  }
}
