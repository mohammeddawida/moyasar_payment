class STCPayModel {
  String? type;
  String? mobile;
  String? referenceNumber;
  String? branch;
  String? cashier;
  String? transactionUrl;
  String? message;

  STCPayModel(this.type, this.mobile, this.referenceNumber, this.branch,
      this.cashier, this.transactionUrl, this.message);

  STCPayModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mobile = json['mobile'];
    referenceNumber = json['reference_number'];
    branch = json['branch'];
    cashier = json['cashier'];
    transactionUrl = json['transaction_url'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['mobile'] = mobile;
    data['reference_number'] = referenceNumber;
    data['branch'] = branch;
    data['cashier'] = cashier;
    data['transaction_url'] = transactionUrl;
    data['message'] = message;
    return data;
  }
}
