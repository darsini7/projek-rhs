import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rhs/model/transaction.dart';

import 'transaction_item.dart';

class DetailTransactionEwallet extends StatelessWidget {
  const DetailTransactionEwallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Text(
                "History Transaksi",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 47, 125, 121),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transactions[index],
              );
            },
            itemCount: transactions.length,
          ),
        ),
      ],
    );
  }
}