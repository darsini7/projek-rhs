import 'package:flutter/material.dart';

import 'paystack/payment_page.dart';

class Kirim extends StatefulWidget {
  const Kirim({super.key});

  @override
  State<Kirim> createState() => _KirimState();
}

class _KirimState extends State<Kirim> {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final referenceController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Momo payment'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: amountController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'required field missing';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Enter the amount',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: TextFormField(
                  controller: referenceController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'required field missing';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Reference',
                    hintText: 'Enter the reference',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'required field missing';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          amount: amountController.text,
                          email: emailController.text,
                          reference: referenceController.text,
                        ),
                      ),
                      );
                    },
                    child: Text('Proceed to make payment'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}