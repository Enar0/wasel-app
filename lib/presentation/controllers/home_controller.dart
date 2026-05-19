import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_controller.dart';
import '../../data/models/place_model.dart';

class HomeController extends GetxController {
  final LocationController locationController = Get.put(LocationController());

  final Rxn<GoogleMapController> mapController = Rxn<GoogleMapController>();
  final RxList<PlaceModel> recentPlaces = <PlaceModel>[].obs;

  final RxString destinationText = ''.obs;
  final RxList<PlaceModel> searchResults = <PlaceModel>[].obs;

  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }

  void recenterMap() {
    if (mapController.value != null && locationController.currentLatLng.value != null) {
      mapController.value!.animateCamera(
        CameraUpdate.newLatLngZoom(locationController.currentLatLng.value!, 15),
      );
    }
  }

  Future<void> onDestinationSearch(String query) async {
    destinationText.value = query;
    if (query.length > 2) {
      // Placeholder for Google Places API call
      // Example of restricted search logic for Libya:
      // final results = await _placesService.search(query, country: 'LY');
      // searchResults.assignAll(results);

      // Mock results
      searchResults.assignAll([
        PlaceModel(id: '1', name: 'Tripoli Mall', address: 'Tripoli, Libya', latitude: 32.8800, longitude: 13.1800),
        PlaceModel(id: '2', name: 'Mitiga International Airport', address: 'Tripoli, Libya', latitude: 32.8900, longitude: 13.2300),
      ]);
    } else {
      searchResults.clear();
    }
  }
}
