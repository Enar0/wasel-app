class FareBreakdownModel {
  final double baseFare;
  final double distanceFare;
  final double timeFare;
  final double serviceFee;
  final double total;

  FareBreakdownModel({
    required this.baseFare,
    required this.distanceFare,
    required this.timeFare,
    required this.serviceFee,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseFare': baseFare,
      'distanceFare': distanceFare,
      'timeFare': timeFare,
      'serviceFee': serviceFee,
      'total': total,
    };
  }

  factory FareBreakdownModel.fromMap(Map<String, dynamic> map) {
    return FareBreakdownModel(
      baseFare: (map['baseFare'] ?? 0.0).toDouble(),
      distanceFare: (map['distanceFare'] ?? 0.0).toDouble(),
      timeFare: (map['timeFare'] ?? 0.0).toDouble(),
      serviceFee: (map['serviceFee'] ?? 0.0).toDouble(),
      total: (map['total'] ?? 0.0).toDouble(),
    );
  }
}
