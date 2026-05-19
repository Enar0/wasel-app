class PaymentResultModel {
  final bool success;
  final String message;
  final String? transactionId;

  PaymentResultModel({
    required this.success,
    required this.message,
    this.transactionId,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'transactionId': transactionId,
    };
  }

  factory PaymentResultModel.fromMap(Map<String, dynamic> map) {
    return PaymentResultModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      transactionId: map['transactionId'],
    );
  }
}
