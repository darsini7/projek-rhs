import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rhs/paystack/paystack_auth_response.dart';
import 'package:http/http.dart' as http;

import '../transaction/transaction.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.amount,
    required this.email,
    required this.reference,
  });

  final String amount;
  final String email;
  final String reference;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

Future<PayStackAuthResponse> createTransaction(Transaction transaction) async{
  
  const String url = 'https://api.paystack.co/transaction/initialize';
  final data = transaction.toJson();

  try{
    final response = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${Apikey.secreteKey}',
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}