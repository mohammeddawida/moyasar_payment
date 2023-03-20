class PayModel {
  late String id; //payment’s unique ID.
  String status = 'initiated'; // payment status.(default: initiated)
  late int amount; // payment amount in halals.
  late int fee; // transaction fee in halals.
  String currency =
      "SAR"; // 3 currency code iso alpha payment currency. (default: SAR);
  int refunded = 0; // refunded amount in halals. (default: 0)
  String? refundedAt; // datetime of refunded. (default: null)
  int captured = 0; // captured amount in halals. (default: 0)
  String?
      capturedAt; // datetime of authroized payment captured. (default: null)
  String? voidedAt; // datetime of voided. (default: null)
  String? description; // payment description
  String?
      invoiceId; // ID of the invoice this payment is for if one exists.(default: null)
  late String ip; // User IP
  late String
      callbackUrl; // page url in customer’s site for final redirection. (used for creditcard 3-D secure and form payment)
  late String createdAt; // creation timestamp in ISO 8601 format.
  late String updatedAt; // modification timestamp in ISO 8601 format.
  Object? metadata; // metadata object (default: null)
  late var source; // source object defined the type of payment.
  String? type;
  String message = '';
  dynamic error ;

  PayModel(
      this.id,
      this.status,
      this.amount,
      this.fee,
      this.currency,
      this.refunded,
      this.refundedAt,
      this.captured,
      this.capturedAt,
      this.voidedAt,
      this.description,
      this.invoiceId,
      this.ip,
      this.callbackUrl,
      this.createdAt,
      this.updatedAt,
      this.metadata,
      this.source,
      this.type,
      this.message,
      this.error
      );

  PayModel.fromJson(Map<String, dynamic> json) {
    if (json['type'] == null) {
      id = json['id'];
      status = json['status'];
      amount = json['amount'];
      fee = json['fee'];
      currency = json['currency'];
      refunded = json['refunded'];
      refundedAt = json['refundedAt'];
      captured = json['captured'];
      capturedAt = json['capturedAt'];
      voidedAt = json['voidedAt'];
      description = json['description'] ?? '';
      invoiceId = json['invoiceId'];
      ip = json['ip'];
      callbackUrl = json['callbackUrl'] ?? '';
      createdAt = json['createdAt'] ?? '';
      updatedAt = json['updatedAt'] ?? '';
      metadata = json['metadata'] ?? '';
      source = json['source'];
      type = json['type'];
      message = json['message'] ?? '';
      error = json['errors'] ?? '';
    } else {
      type = json['type'];
      message = json['message'] ?? '';
      error = json['errors'] ?? '';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['amount'] = amount;
    data['fee'] = fee;
    data['currency'] = currency;
    data['refunded'] = refunded;
    data['refundedAt'] = refundedAt;
    data['captured'] = captured;
    data['capturedAt'] = capturedAt;
    data['voidedAt'] = voidedAt;
    data['description'] = description;
    data['invoiceId'] = invoiceId;
    data['ip'] = ip;
    data['callbackUrl'] = callbackUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['metadata'] = metadata;
    data['source'] = source;
    data['type'] = type;
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}
