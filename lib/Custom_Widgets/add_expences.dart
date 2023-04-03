import 'package:expencesbook/Models/transactions_model.dart';
import 'package:expencesbook/Provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddExpences extends StatefulWidget {
  @override
  State<AddExpences> createState() => _AddExpencesState();
}

class _AddExpencesState extends State<AddExpences> {
  var selectedDate;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txProvider = Provider.of<Transactions>(context, listen: false);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape
        ? Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Transactions',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'Choose Date'
                              : DateFormat('yyyy-MM-dd ').format(selectedDate),
                          style: const TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2090));
                            if (pickedDate == null) {
                              return;
                            } else {
                              setState(() {
                                selectedDate = pickedDate;
                                print(selectedDate.toString());
                              });
                            }
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Select Date',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'))),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              final tx = Transaction(
                                title: titleController.text,
                                amount: double.parse(amountController.text),
                                date: selectedDate,
                                id: DateTime.now().toIso8601String(),
                              );

                              txProvider.addTransaction(tx);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: 550,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Transactions',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'Choose Date'
                              : DateFormat('yyyy-MM-dd ').format(selectedDate),
                          style: const TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2090));
                            if (pickedDate == null) {
                              return;
                            } else {
                              setState(() {
                                selectedDate = pickedDate;
                                print(selectedDate.toString());
                              });
                            }
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Select Date',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'))),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              final tx = Transaction(
                                title: titleController.text,
                                amount: double.parse(amountController.text),
                                date: selectedDate,
                                id: DateTime.now().toIso8601String(),
                              );

                              txProvider.addTransaction(tx);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
