import 'package:flutter/material.dart';
import 'package:moyasar_payment/model/paymodel.dart';
import 'package:moyasar_payment/model/source/applepaymodel.dart';
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

              PayModel data = await MoyasarPayment().applePay(
                  amount: 1.0,
                  publishableKey:
                      "pk_live_xxxxx",
                  applepayMerchantId: "merchant.xxxxx",
                  paymentItems: {'Item': 1.0},
                  currencyCode: "SAR",
                  countryCode: "SA");
              if (data.type != null) {
                print(data.message);
              } else {
                ApplePayModel applePayModel = ApplePayModel.fromJson(data.source);
                print(applePayModel.toJson());
                print(data.id);
                
              }
            },
            child: Text('Pay'),
          ),
        ),
      ),
    );
  }
}
