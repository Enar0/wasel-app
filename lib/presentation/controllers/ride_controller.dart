import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/models/ride_model.dart';
import '../../data/models/driver_model.dart';
import '../../data/models/fare_breakdown_model.dart';
import '../../core/services/fare_service.dart';
import '../../routes/app_routes.dart';

class RideController extends GetxController {
  final FareService _fareService = FareService();

  final pickupLocation = Rxn<LatLng>();
  final destinationLocation = Rxn<LatLng>();
  final pickupAddress = ''.obs;
  final destinationAddress = ''.obs;

  final selectedRideType = 'economy'.obs;
  final estimatedFare = 0.0.obs;
  final rideStatus = RideStatus.idle.obs;

  final driverInfo = Rxn<DriverModel>();
  final remainingTime = 0.obs; // minutes
  final remainingDistance = 0.0.obs; // km
  final paymentMethod = 'cash'.obs;

  final Rxn<FareBreakdownModel> fareBreakdown = Rxn<FareBreakdownModel>();

  void setPickup(LatLng latLng, String address) {
    pickupLocation.value = latLng;
    pickupAddress.value = address;
  }

  void setDestination(LatLng latLng, String address) {
    destinationLocation.value = latLng;
    destinationAddress.value = address;
    calculateFare();
  }

  void calculateFare() {
    if (pickupLocation.value != null && destinationLocation.value != null) {
      // Mock distance and time
      double distance = 10.5; // km
      double time = 15.0; // minutes

      final breakdown = _fareService.calculateFare(
        distanceKm: distance,
        timeMinutes: time,
        rideType: selectedRideType.value,
      );

      fareBreakdown.value = breakdown;
      estimatedFare.value = breakdown.total;
    }
  }

  Future<void> requestRide() async {
    rideStatus.value = RideStatus.searchingDriver;
    Get.toNamed(AppRoutes.waitingDriver);

    // Simulate searching
    await Future.delayed(const Duration(seconds: 3));
    acceptMockDriver();
  }

  void acceptMockDriver() {
    driverInfo.value = DriverModel(
      id: 'driver_123',
      fullName: 'Ahmed Mohammed',
      phoneNumber: '+218910000000',
      photoUrl: 'https://i.pravatar.cc/150?u=driver',
      rating: 4.8,
      carModel: 'Hyundai Elantra 2022',
      plateNumber: '12345-6',
      currentLat: 32.88,
      currentLng: 13.18,
    );
    rideStatus.value = RideStatus.driverAssigned;

    // Simulate arrival
    Future.delayed(const Duration(seconds: 5), () {
      rideStatus.value = RideStatus.driverArriving;
      Future.delayed(const Duration(seconds: 3), startRide);
    });
  }

  void startRide() {
    rideStatus.value = RideStatus.inProgress;
    Get.offNamed(AppRoutes.duringRide);

    // Simulate progress
    remainingTime.value = 15;
    remainingDistance.value = 10.5;
  }

  void completeRide() {
    rideStatus.value = RideStatus.completed;
    Get.offNamed(AppRoutes.rideCompleted);
  }

  void cancelRide() {
    rideStatus.value = RideStatus.cancelled;
    Get.offAllNamed(AppRoutes.home);
  }

  void rateDriver(double rating) {
    // API call to rate driver
    Get.snackbar('Success', 'Thank you for rating!');
  }

  void shareRideTracking() {
    // Placeholder for sharing link
    Get.snackbar('Success', 'Tracking link copied to clipboard');
  }
}
