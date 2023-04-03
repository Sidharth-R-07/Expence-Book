import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double totalSpeding;
  final double percentegeOfSpending;

  ChartBar(
    this.title,
    this.totalSpeding,
    this.percentegeOfSpending,
  );

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLandscape
            ? Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 14,
                      child: FittedBox(
                        child: Text(title),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 70,
                      height: 8,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300),
                          ),
                          FractionallySizedBox(
                            widthFactor: percentegeOfSpending,
                            child: Container(
                                decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 20,
                      child: FittedBox(
                        child: Text(
                          "₹ ${totalSpeding.toStringAsFixed(0)}",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    child: FittedBox(
                      child: Text(
                        "₹ ${totalSpeding.toStringAsFixed(0)}",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  Container(
                    width: 8,
                    height: MediaQuery.of(context).size.height * 0.050,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300),
                        ),
                        FractionallySizedBox(
                          heightFactor: percentegeOfSpending,
                          child: Container(
                              decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  FittedBox(
                    child: Text(
                      title,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                ],
              ));
  }
}
