
import 'package:hive/hive.dart';

part 'transactions_model.g.dart';

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
   final String id;
   @HiveField(1)
  final String title;
 @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.id,
  });
}
