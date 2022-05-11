import 'package:flutter/material.dart';
import 'package:moyasar_payment/moyasar_payment.dart';

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
              
              await MoyasarPayment().creditCard(amount: 20.0, publishableKey: 'publishableKey', cardHolderName: 'cardHolderName', cardNumber: 'cardNumber', cvv: 'cvv', expiryManth: 'expiryManth', expiryYear: 'expiryYear', callbackUrl: 'callbackUrl');
            },
            child: Text('gdg'))
        ),
      ),
    );
  }
}
