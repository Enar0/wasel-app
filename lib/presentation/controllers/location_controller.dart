import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/services/location_service.dart';

class LocationController extends GetxController {
  final LocationService _locationService = LocationService();

  final Rxn<Position> currentPosition = Rxn<Position>();
  final Rxn<LatLng> currentLatLng = Rxn<LatLng>();
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    try {
      isLoading.value = true;
      final position = await _locationService.getCurrentLocation();
      currentPosition.value = position;
      currentLatLng.value = LatLng(position.latitude, position.longitude);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  void updateCurrentLocation(Position position) {
    currentPosition.value = position;
    currentLatLng.value = LatLng(position.latitude, position.longitude);
  }
}
