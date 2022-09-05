library moyasar_payment;

// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:convert';
// import 'package:flutter_pay/flutter_pay.dart';
import 'package:http/http.dart' as http;
import './flutter_pay.dart';
import 'package:moyasar_payment/model/paymodel.dart';

class MoyasarPayment {
  // static const MethodChannel _channel = MethodChannel('moyaser_payment');

  // static Future<String?> get platformVersion async {
  //   final String? version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  String moyasarApi = 'https://api.moyasar.com/v1/payments';

  /// * All parameters are [amount], [publishableKey] and [source] must be non-null.
  /// * [description] An arbitrary string which you can attach to a payment object. Payment description is only for your reference and it is NOT displayed to users.
  /// * [amount] Total purchase amount in Saudi riyals
  /// * [publishableKey] Moyasar offer its clients a unique API keys to authenticates their API request.
  /// * [callbackUrl] URL of customer’s website page to be redirected to when using payment form method or after 3-D secure transaction (e.g., https://example.com/orders) . (for creditcard source only)
  /// * [source] A payment source object to be charged, such as Apple Pay source, Credit Card source or STC pay source. The details are described below.
  Future<PayModel> _pay(
      {String? description,
      required double amount,
      required String publishableKey,
      String? callbackUrl,
      required var source}) async {
    var headers = <String, String>{
      'Content-type': 'application/json',
      'Authorization':
          'Basic ' + base64Encode(utf8.encode(publishableKey + ':'))
    };
    var data = <String, dynamic>{
      'amount': (amount * 100).round(),
      'source': source
    };
    if (callbackUrl != null) {
      data['callback_url'] = callbackUrl;
    }
    if (description != null) {
      data['description'] = description;
    }
    http.Response res = await http.post(Uri.parse(moyasarApi),
        body: json.encode(data), headers: headers);

    PayModel pay = PayModel.fromJson(jsonDecode(res.body));
    return pay;
  }

  /// # Apple Pay
  /// * All parameters are [amount], [publishableKey], [applepayMerchantId], [paymentItems], [currencyCode] and [countryCode] must be non-null.
  /// * [description] An arbitrary string which you can attach to a payment object. Payment description is only for your reference and it is NOT displayed to users.
  /// * [amount] Total purchase amount in Saudi riyals
  /// * [publishableKey] Moyasar offer its clients a unique API keys to authenticates their API request.
  /// * [applepayMerchantId] A merchant identifier uniquely identifies you to Apple Pay as a merchant who is able to accept payments. A merchant identifier never expires, and you can use the same one for multiple native and web apps. Go to [Moyasar Documentation](https://moyasar.com/docs/dashboard/apple-pay/developer-account/)
  /// * [paymentItems] ``` {'item 1': 1000 , 'item2' : 100} ``` or  ```{'Name Company': 1000,'total order': 1000}```
  /// * [currencyCode] e.g. SAR or UAE ....
  /// * [countryCode]  e.g. SA or UA ...
  Future applePay({
    String? description,
    required double amount,
    required String publishableKey,
    required var applepayMerchantId,
    required Map<String, double> paymentItems,
    required String currencyCode,
    required String countryCode,
  }) async {
    var paymentItemsList = <PaymentItem>[];
    paymentItems.forEach((key, value) {
      paymentItemsList.add(
        PaymentItem(
          name: key,
          price: value,
        ),
      );
    });

    FlutterPay flutterPay = FlutterPay();
    flutterPay.setEnvironment(environment: PaymentEnvironment.Production);
    var token = await flutterPay.requestPayment(
        allowedPaymentNetworks: [
          PaymentNetwork.visa,
          PaymentNetwork.mada,
          PaymentNetwork.masterCard
        ],
        appleParameters:
            AppleParameters(merchantIdentifier: applepayMerchantId),
        currencyCode: currencyCode.toUpperCase(),
        countryCode: countryCode.toUpperCase(),
        paymentItems: paymentItemsList,
        supportedCountries: ['SA']);
    var source = {'type': 'applepay', 'token': token};
    // return token;
    return _pay(
        description: description,
        amount: amount,
        publishableKey: publishableKey,
        source: source);
  }

  /// # Credit Card
  /// * All parameters are [amount], [publishable_key], [cardHolderName], [cardNumber], [cvv], [expiryDate_manth],[expiryDate_yar] and [callback_url] must be non-null.
  /// * [description] An arbitrary string which you can attach to a payment object. Payment description is only for your reference and it is NOT displayed to users.
  /// * [amount] Total purchase amount in Saudi riyals
  /// * [publishableKey] Moyasar offer its clients a unique API keys to authenticates their API request.
  /// * [cardHolderName] Card holder’s name.
  /// * [cardNumber] The card number, as a string without any separators.
  /// * [cvv] Card security code. CVV or CVC
  /// * [expiryMonth] Two digit number representing the card’s expiration month.
  /// * [expiryYear] Two or Four digit number representing the card’s expiration year.
  /// * [callbackUrl] URL of customer’s website page to be redirected to when using payment form method or after 3-D secure transaction (e.g., https://example.com/orders)
  Future creditCard({
    String? description,
    required double amount,
    required String publishableKey,
    required String cardHolderName,
    required String cardNumber,
    required String cvv,
    required String expiryMonth,
    required String expiryYear,
    required String callbackUrl,
  }) async {
    var source = {
      'type': 'creditcard',
      'name': cardHolderName,
      'number': cardNumber,
      'cvc': cvv,
      'month': expiryMonth,
      'year': expiryYear
    };

    return _pay(
        description: description,
        amount: amount,
        publishableKey: publishableKey,
        source: source,
        callbackUrl: callbackUrl);
  }

  /// # STC Pay
  /// * All parameters are [amount], [publishable_key] and [phoneNumber] must be non-null.
  /// * [description] An arbitrary string which you can attach to a payment object. Payment description is only for your reference and it is NOT displayed to users.
  /// * [amount] Total purchase amount in Saudi riyals
  /// * [publishable_key] Moyasar offer its clients a unique API keys to authenticates their API request.
  /// * [phoneNumber] Customer mobile number. (e.g., 05XXXXXXX)
  Future stcPay({
    String? description,
    required double amount,
    required String publishableKey,
    required String phoneNumber,
  }) async {
    var source = {'type': 'StcPay', 'mobile': phoneNumber, 'cashier': 'app'};
    return _pay(
        description: description,
        amount: amount,
        publishableKey: publishableKey,
        source: source);
  }

  /// # STC Pay OTP Verification
  /// * All parameters are [transaction_url] and [otpValue] must be non-null.
  /// * [transactionUrl] 	URL to confirm payment authorization.
  /// * [otpValue]

  Future stcPayOtp(
      {required String transactionUrl, required String otpValue}) async {
    var data =
        await http.get(Uri.parse(transactionUrl + '&otp_value=' + otpValue));
    return data;
  }
}
