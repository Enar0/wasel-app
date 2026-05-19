import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../controllers/home_controller.dart';
import '../../../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
      body: Stack(
        children: [
          // 60% Map
          Obx(() => homeController.locationController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: homeController.locationController.currentLatLng.value ??
                          const LatLng(32.8872, 13.1913), // Tripoli fallback
                      zoom: 15,
                    ),
                    onMapCreated: homeController.onMapCreated,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                  ),
                )),

          // Recenter Button
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            right: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: homeController.recenterMap,
              child: const Icon(Icons.my_location, color: AppColors.primary),
            ),
          ),

          // Bottom Card (40%)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.rideOptions),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: AppColors.primary),
                              const SizedBox(width: 12),
                              Text(
                                'where_to'.tr,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Quick Actions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildQuickAction(Icons.home, 'home'.tr),
                          _buildQuickAction(Icons.work, 'work'.tr),
                          _buildQuickAction(Icons.star, 'favorites'.tr),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Ride Types Preview
                      Text(
                        'economy'.tr, // Title placeholder
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildRideCard('Economy', Icons.directions_car, AppColors.primary),
                            _buildRideCard('Family', Icons.people, Colors.green),
                            _buildRideCard('Delivery', Icons.delivery_dining, Colors.orange),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.history), label: 'my_rides'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.account_balance_wallet), label: 'wallet'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'account'.tr),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildRideCard(String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
        color: color.withOpacity(0.05),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12)),
        ],
      ),
    );
  }
}
