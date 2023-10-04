import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 47, 125, 121),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 47, 125, 121),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Center(
                child: Text(
                  transaction.to
                  .split("")
                  .map((e) => e.substring(0,1))
                  .toList()
                  .join(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 47, 125, 121),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    transaction.to,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 47, 125, 121),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                    transaction.date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 47, 125, 121),
                    ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "- Rp. ${transaction.amount}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFA6D6D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                    transaction.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 47, 125, 121),
                    ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}