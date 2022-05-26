import 'package:flutter/material.dart';
import 'package:moyasar_payment/moyasar_payment.dart';
import 'package:moyasar_payment/model/paymodel.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: InkWell(
            onTap: ()async{
              PayModel pay = await MoyasarPayment().
              creditCard(amount: 20.0, 
              publishableKey: 'pk_xxxx', 
              cardHolderName: 'mahmmd awad', 
              cardNumber: '4111111111111111', 
              cvv: '123', 
              expiryManth: '04', 
              expiryYear: '23', 
              callbackUrl: 'http:\\example.com\\');
              print(pay.toJson());
            },
            child: Text('pay'))
        ),
      ),
    );
  }
}
