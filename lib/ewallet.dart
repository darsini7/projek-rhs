import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'model/transaction.dart';
import 'widgets/menu_box.dart';
import 'widgets/transaction_detail.dart';
import 'widgets/transaction_item.dart';

class Ewallet extends StatefulWidget {
  const Ewallet({super.key});

  @override
  State<Ewallet> createState() => _EwalletState();
}

class _EwalletState extends State<Ewallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff368983),
              Color.fromRGBO(47, 125, 121, 0.3),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromARGB(255, 47, 125, 121),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text(
                          "Hallo,",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                  
                        Text(
                          "Saiful Bahri",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Stack(
                      children: const[
                        Icon(
                          Icons.notification_add_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                          top: 0.0,
                          child: Icon(
                            Icons.brightness_1,
                            size: 8.0,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Column(
                children: const[
                  Text(
                    "Saldo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:Text(
                    "Rp. 2,000,000,000",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),  
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MenuWidget(
                    icon: Icons.send_rounded,
                    text: "Kirim",
                  ),
                  MenuWidget(
                    icon: Icons.account_balance_wallet,
                    text: "Terima",
                  ),
                  MenuWidget(
                    icon: Icons.payment,
                    text: "Bayar",
                  ),
                  MenuWidget(
                    icon: Icons.more_horiz,
                    text: "Lainnya",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 25,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Transaksi Terakhir",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF3D538F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext ctx) {
                                  return const DetailTransactionEwallet();
                                },
                              );
                            },
                            child: const Text(
                              'Lihat Semua',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF3D538F),
                              ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}