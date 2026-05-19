import 'fare_breakdown_model.dart';

enum RideStatus {
  idle,
  selectingDestination,
  choosingRide,
  searchingDriver,
  driverAssigned,
  driverArriving,
  inProgress,
  completed,
  cancelled
}

class RideModel {
  final String id;
  final String riderId;
  final String? driverId;
  final String pickupAddress;
  final String destinationAddress;
  final double pickupLat;
  final double pickupLng;
  final double destinationLat;
  final double destinationLng;
  final String rideType;
  final double estimatedFare;
  final RideStatus status;
  final DateTime createdAt;
  final FareBreakdownModel? fareBreakdown;

  RideModel({
    required this.id,
    required this.riderId,
    this.driverId,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.pickupLat,
    required this.pickupLng,
    required this.destinationLat,
    required this.destinationLng,
    required this.rideType,
    required this.estimatedFare,
    required this.status,
    required this.createdAt,
    this.fareBreakdown,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'riderId': riderId,
      'driverId': driverId,
      'pickupAddress': pickupAddress,
      'destinationAddress': destinationAddress,
      'pickupLat': pickupLat,
      'pickupLng': pickupLng,
      'destinationLat': destinationLat,
      'destinationLng': destinationLng,
      'rideType': rideType,
      'estimatedFare': estimatedFare,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'fareBreakdown': fareBreakdown?.toMap(),
    };
  }

  factory RideModel.fromMap(Map<String, dynamic> map) {
    return RideModel(
      id: map['id'] ?? '',
      riderId: map['riderId'] ?? '',
      driverId: map['driverId'],
      pickupAddress: map['pickupAddress'] ?? '',
      destinationAddress: map['destinationAddress'] ?? '',
      pickupLat: (map['pickupLat'] ?? 0.0).toDouble(),
      pickupLng: (map['pickupLng'] ?? 0.0).toDouble(),
      destinationLat: (map['destinationLat'] ?? 0.0).toDouble(),
      destinationLng: (map['destinationLng'] ?? 0.0).toDouble(),
      rideType: map['rideType'] ?? 'economy',
      estimatedFare: (map['estimatedFare'] ?? 0.0).toDouble(),
      status: RideStatus.values.byName(map['status'] ?? 'idle'),
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      fareBreakdown: map['fareBreakdown'] != null
          ? FareBreakdownModel.fromMap(map['fareBreakdown'])
          : null,
    );
  }
}
