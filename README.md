# Moyasar Flutter Plugin

<img src="https://mohammed-dev.com/moyasar-flutter.png" width="500" />

## :rocket: Installation

This plugin is available on Pub: [https://pub.dev/packages/moyasar_payment](https://pub.dev/packages/moyasar_payment)

Add this to `dependencies` in your app's `pubspec.yaml`

```yaml
moyasar_payment : latest_version
```

## :bookmark: Usage

<!-- Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart). -->
Import `moyasar_payment.dart`

```dart
import 'package:moyasar_payment/moyasar_payment.dart';
```
Import `paymodel.dart`

```dart
import 'package:moyasar_payment/model/paymodel.dart';
```

#### Integrate Apple Pay

Import `applepaymodel.dart`

```dart
import 'package:moyasar_payment/model/source/applepaymodel.dart';
```

```dart
var items = <String,double>{
              'Item 1': 20.0,
              'Item 2' : 80.0
            };
                          
PayModel res = await MoyasarPayment().applePay(
    amount: 100.0, 
    publishableKey: 'publishable_key', 
    applepayMerchantId: 'applepay_merchant_id', 
    paymentItems: items, 
    currencyCode: 'SAR', 
    countryCode: 'SA',
    description: 'description');

if (res.type != null) { // User Cancelled The Payment
        print(res.message);
    } else {
        ApplePayModel applePayModel = ApplePayModel.fromJson(res.source);
    
    }
```

#### Integrate Credit Card
Import `creditcardmodel.dart`

```dart
import 'package:moyasar_payment/model/source/creditcardmodel.dart';
```

```dart
PayModel res = await MoyasarPayment().creditCard(
    description :'description', 
    amount: 100.0, 
    publishableKey: 'publishable_key', 
    cardHolderName: 'cardHolderName', 
    cardNumber: 'cardNumber', 
    cvv: 'cvv', 
    expiryManth: 'expiryDate_manth', 
    expiryYear: 'expiryDate_yar', 
    callbackUrl: 'https://example.com/orders');

CreditcardModel creditcardModel = CreditcardModel.fromJson(res.source);
    print(creditcardModel.toJson());
```

#### Integrate STC Pay
Import `creditcardmodel.dart`

```dart
import 'package:moyasar_payment/model/source/creditcardmodel.dart';
```

```dart
PayModel res = await MoyasarPayment().stcPay(
    amount: 100.0, 
    phoneNumber: 'phoneNumber', 
    publishableKey: 'publishable_key',
    description: 'description');

STCPayModel stcPayModel = STCPayModel.fromJson(res.source);
            print(stcPayModel.toJson())

```
##### STC Pay OTP Verification
```dart
var resdata = await MoyasarPayment().StcPayOtp(
    otpValue: 'otp Value',
    transactionUrl: 'transaction_url';
```

### :heart:  Found this project useful?

If you found this project useful, then please consider giving it a :star:  on Github and sharing it with your friends via social media.

<br>
:🪄: Contributing, :disappointed: Issues and :bug: Bug Reports

The project is open to public contribution. Please feel very free to contribute.
Experienced an issue or want to report a bug? Please, [report it here](https://github.com/mahmmd/moyasar_payment/issues). Remember to be as descriptive as possible.
