part of flutter_pay;

class FlutterPay {
  final MethodChannel _channel = MethodChannel('flutter_pay');

  void setEnvironment(
      {PaymentEnvironment environment = PaymentEnvironment.Test}) {
    var params = <String, bool>{
      "isTestEnvironment": environment == PaymentEnvironment.Test,
    };
    _channel.invokeMethod('switchEnvironment', params);
  }

  /// Process the payment and returns the token from Apple/Google pay
  ///
  /// Can throw [FlutterPayError]
  ///
  /// * [appleParameters] - options for Apple Pay
  /// * [allowedPaymentNetworks] - List of allowed payment networks.
  /// See [PaymentNetwork].
  /// * [allowedCardAuthMethods] - List of allowed authenticaion methods
  /// methods for Google Pay.
  /// * [paymentItems] - affects only Apple Pay. See [PaymentItem]
  /// Mercant name which will be displayed to customer.
  Future<String> requestPayment(
      {AppleParameters? appleParameters,
      List<PaymentNetwork> allowedPaymentNetworks = const [],
      required List<PaymentItem> paymentItems,
      bool emailRequired = false,
      required String currencyCode,
      required String countryCode,
      required List<String> supportedCountries}) async {
    var items = paymentItems.map((item) => item.toJson()).toList();
    var params = <String, dynamic>{
      "currencyCode": currencyCode,
      "countryCode": countryCode,
      "allowedPaymentNetworks":
          allowedPaymentNetworks.map((network) => network.getName).toList(),
      "items": items,
      "emailRequired": emailRequired,
      "supportedCountries": supportedCountries
    };

    if (Platform.isIOS && appleParameters != null) {
      params.addAll(appleParameters.toMap());
    } else {
      throw FlutterPayError(description: "");
    }

    try {
      var response = await _channel.invokeMethod('requestPayment', params);
      return response;
    } on PlatformException catch (error) {
      if (error.code == "userCancelledError") {
        print(error.message);
        return "";
      }
      if (error.code == "paymentError") {
        print(error.message);
        return "";
      }
      throw FlutterPayError(code: error.code, description: error.message);
    }
  }
}
