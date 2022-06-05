class ApplePayModel {
  String? type; // type of payment, creditcard.
  String? company; // credit card’s company mada or visa or master or amex
  String? name; // credit card’s holder name
  String? number; // credit card’s masked number
  String? message; // payment gateway message
  String? gatewayId; // Payment’s internal gateway identifier
  String? referenceNumber; // Payment’s bank reference number

  ApplePayModel(this.type, this.company, this.name, this.number, this.message,
      this.gatewayId, this.referenceNumber);

  ApplePayModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    company = json['company'];
    name = json['name'];
    number = json['number'];
    message = json['message'];
    gatewayId = json['gateway_id'];
    referenceNumber = json['reference_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['company'] = company;
    data['name'] = name;
    data['number'] = number;
    data['message'] = message;
    data['gateway_id'] = gatewayId;
    data['reference_number'] = referenceNumber;
    return data;
  }
}
