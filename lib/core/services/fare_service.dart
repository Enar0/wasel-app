import '../../data/models/fare_breakdown_model.dart';

class FareService {
  // Rates for Tripoli, Libya (Hypothetical)
  static const double baseFareEconomy = 5.0;
  static const double pricePerKmEconomy = 1.5;
  static const double pricePerMinuteEconomy = 0.5;

  static const double baseFareFamily = 8.0;
  static const double pricePerKmFamily = 2.5;
  static const double pricePerMinuteFamily = 0.8;

  static const double baseFareDelivery = 6.0;
  static const double pricePerKmDelivery = 2.0;
  static const double pricePerMinuteDelivery = 0.4;

  FareBreakdownModel calculateFare({
    required double distanceKm,
    required double timeMinutes,
    required String rideType,
  }) {
    double base;
    double perKm;
    double perMinute;

    switch (rideType.toLowerCase()) {
      case 'family':
        base = baseFareFamily;
        perKm = pricePerKmFamily;
        perMinute = pricePerMinuteFamily;
        break;
      case 'delivery':
        base = baseFareDelivery;
        perKm = pricePerKmDelivery;
        perMinute = pricePerMinuteDelivery;
        break;
      default:
        base = baseFareEconomy;
        perKm = pricePerKmEconomy;
        perMinute = pricePerMinuteEconomy;
    }

    double distanceFare = distanceKm * perKm;
    double timeFare = timeMinutes * perMinute;
    double serviceFee = (base + distanceFare + timeFare) * 0.1; // 10% service fee
    double total = base + distanceFare + timeFare + serviceFee;

    return FareBreakdownModel(
      baseFare: base,
      distanceFare: distanceFare,
      timeFare: timeFare,
      serviceFee: serviceFee,
      total: total,
    );
  }
}
