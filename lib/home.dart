import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rhs/model/kedai.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

List<String> kedai=["Pilih Kedai","Kedai Paijo", "Kedai Kita", "Kedai Acong"];
List<String> kedaiSaldo=["0","20.000", "30.000", "40.000"];
String _kedai="Pilih Kedai";
String _kedaiSaldo = "0";
double totalSaldo = 0.0;

 void pilihKedai(value){
  setState((){
    _kedai=value;
    _kedaiSaldo = kedaiSaldo.elementAt(kedai.indexWhere((element) => element == value));
    calculateTotalSaldo();
  });
}

void calculateTotalSaldo() {
 double saldoValue = double.tryParse(_kedaiSaldo.replaceAll("Rp.","").replaceAll(",", "")) ?? 0.0;

 setState(() {
   totalSaldo = saldoValue;
 }); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xff368983),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              
              children: [
                Text('Total Saldo'),
                Spacer(),
                Text(currencyFormat.format(500000)),
              ],
            ),

            new Padding(padding: new EdgeInsets.only(top: 20.0),),

            Row(
              children: [
                    DropdownButton(
                   onChanged: (value){
                    pilihKedai(value);
                    },
                    value: _kedai,
                    items: kedai.map((String value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                   }).toList(),
                  ),
               
              Spacer(),
              Text ("${_kedaiSaldo}"),
              ],
            ),
            
            new Padding(padding: new EdgeInsets.only(top: 10.0),),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                   contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  hintText: 'Pencarian',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 2,
                ),
                columns: [
                  DataColumn(
                    label: Text('No'),
                  ),
                  DataColumn(
                    label: Text('Tanggal'),
                  ),
                  DataColumn(
                    label: Text('Tipe Voucher'),
                  ),
                  DataColumn(
                    label: Text('Harga'),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('2023-09-19')),
                    DataCell(Text('Voucher A')),
                    DataCell(Text('100.000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('2023-09-19')),
                    DataCell(Text('Voucher b')),
                    DataCell(Text('50.000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('2023-09-20')),
                    DataCell(Text('Voucher c')),
                    DataCell(Text('50.000')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

