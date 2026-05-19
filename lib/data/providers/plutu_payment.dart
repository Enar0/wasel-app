import 'payment_gateway.dart';
import '../models/payment_result_model.dart';

class PlutuPayment implements PaymentGateway {
  @override
  Future<PaymentResultModel> processPayment(double amount, Map<String, dynamic> details) async {
    // Placeholder for Plutu API integration
    return PaymentResultModel(
      success: true,
      message: 'Plutu payment pending/simulated',
    );
  }
}
