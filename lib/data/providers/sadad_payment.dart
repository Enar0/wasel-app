import 'payment_gateway.dart';
import '../models/payment_result_model.dart';

class SadadPayment implements PaymentGateway {
  @override
  Future<PaymentResultModel> processPayment(double amount, Map<String, dynamic> details) async {
    // Placeholder for Sadad API integration
    return PaymentResultModel(
      success: true,
      message: 'Sadad payment pending/simulated',
    );
  }
}
