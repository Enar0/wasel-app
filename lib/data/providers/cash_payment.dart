import 'payment_gateway.dart';
import '../models/payment_result_model.dart';

class CashPayment implements PaymentGateway {
  @override
  Future<PaymentResultModel> processPayment(double amount, Map<String, dynamic> details) async {
    // Cash is handled offline, so we always return success
    return PaymentResultModel(
      success: true,
      message: 'Cash payment confirmed',
      transactionId: 'CASH_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
