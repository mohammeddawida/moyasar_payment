import 'package:flutter/material.dart';
import 'package:moyasar_payment/model/paymodel.dart';
import 'package:moyasar_payment/model/source/applepaymodel.dart';
import 'package:moyasar_payment/model/source/creditcardmodel.dart';
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
            onTap: () async {
              PayModel data = await MoyasarPayment().creditCard(
                amount: 100, 
                publishableKey: 'sk_test_PJvwERLjjdQyHhhrRtHC37CMX5gWsyBzZa7dccju', 
                cardHolderName: 'ma d', 
                cardNumber: '4111111111111111', 
                cvv: 112, 
                expiryManth: 12, 
                expiryYear: 25, 
                callbackUrl: 'https://example.com/orders');
                // print(data.type);
                // print(data.message);
                // print(data.error);
                CreditcardModel creditcardModel = CreditcardModel.fromJson(data.source);
                print(creditcardModel.toJson());
            },
            child: Text('Pay'),
          ),
        ),
      ),
    );
  }
}
