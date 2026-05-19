import '../models/payment_result_model.dart';

abstract class PaymentGateway {
  Future<PaymentResultModel> processPayment(double amount, Map<String, dynamic> details);
}
