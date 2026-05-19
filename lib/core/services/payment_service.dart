import '../../data/models/payment_result_model.dart';
import '../../data/providers/payment_gateway.dart';
import '../../data/providers/cash_payment.dart';
import '../../data/providers/tlync_payment.dart';
import '../../data/providers/plutu_payment.dart';
import '../../data/providers/sadad_payment.dart';

class PaymentService {
  PaymentGateway _getGateway(String method) {
    switch (method.toLowerCase()) {
      case 't-lync':
        return TlyncPayment();
      case 'plutu':
        return PlutuPayment();
      case 'sadad':
        return SadadPayment();
      default:
        return CashPayment();
    }
  }

  Future<PaymentResultModel> processPayment(String method, double amount, Map<String, dynamic> details) async {
    final gateway = _getGateway(method);
    return await gateway.processPayment(amount, details);
  }
}
