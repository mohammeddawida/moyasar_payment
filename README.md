## :rocket: Installation

This plugin is available on Pub: [https://pub.dev/packages/moyasar_payment](https://pub.dev/packages/moyasar_payment)

Add this to `dependencies` in your app's `pubspec.yaml`

```yaml
moyasar_payment : latest_version
```

## :bookmark: Usage

<!-- Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart). -->

#### Integrate Apple Pay

```dart
var items = <String,double>{
              'Item 1': 20.0,
              'Item 2' : 80.0
            };
                          
var res = await MoyasarPayment().applePay(
    amount: 100.0, 
    publishableKey: 'publishable_key', 
    applepayMerchantId: 'applepay_merchant_id', 
    paymentItems: items, 
    currencyCode: 'SAR', 
    countryCode: 'SA',
    description: 'description');
```

#### Integrate Credit Card

```dart
var res = await MoyasarPayment().creditCard(
    description :'description', 
    amount: 100.0, 
    publishableKey: 'publishable_key', 
    cardHolderName: 'cardHolderName', 
    cardNumber: 'cardNumber', 
    cvv: 'cvv', 
    expiryManth: 'expiryDate_manth', 
    expiryYear: 'expiryDate_yar', 
    callbackUrl: 'https://example.com/orders');
```

#### Integrate STC Pay

```dart
var res = await MoyasarPayment().stcPay(
    amount: 100.0, 
    phoneNumber: 'phoneNumber', 
    publishableKey: 'publishable_key',
    description: 'description');
```
##### STC Pay OTP Verification
```dart
var resdata = await MoyasarPayment().StcPayOtp(
    otpValue: 'otp Value',
    transactionUrl: 'transaction_url';
```

### :heart:  Found this project useful?

If you found this project useful, then please consider giving it a :star:  on Github and sharing it with your friends via social media.

=======


<br>
****
## :🪄: Contributing, :disappointed: Issues and :bug: Bug Reports

The project is open to public contribution. Please feel very free to contribute.
Experienced an issue or want to report a bug? Please, [report it here](https://github.com/mahmmd/moyasar_payment/issues). Remember to be as descriptive as possible.
