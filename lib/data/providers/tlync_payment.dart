import 'payment_gateway.dart';
import '../models/payment_result_model.dart';

class TlyncPayment implements PaymentGateway {
  @override
  Future<PaymentResultModel> processPayment(double amount, Map<String, dynamic> details) async {
    // Placeholder for T-LYNC API integration
    return PaymentResultModel(
      success: true,
      message: 'T-LYNC payment pending/simulated',
    );
  }
}
