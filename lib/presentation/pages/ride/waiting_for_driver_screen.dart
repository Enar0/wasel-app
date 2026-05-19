import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../controllers/ride_controller.dart';

class WaitingForDriverScreen extends StatelessWidget {
  const WaitingForDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rideController = Get.find<RideController>();

    return Scaffold(
      body: Stack(
        children: [
          // Map Placeholder (Full screen in background)
          Container(color: Colors.grey[200], child: const Center(child: Text("Map Background"))),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              final driver = rideController.driverInfo.value;
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (driver == null) ...[
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text('searching_driver'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ] else ...[
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(driver.photoUrl),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(driver.fullName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: AppColors.accent, size: 16),
                                    Text(' ${driver.rating}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {}, // Call driver
                            icon: const Icon(Icons.phone, color: AppColors.success),
                            style: IconButton.styleFrom(backgroundColor: AppColors.success.withOpacity(0.1)),
                          ),
                        ],
                      ),
                      const Divider(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(driver.carModel, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(driver.plateNumber, style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("ETA", style: TextStyle(color: Colors.grey)),
                              Text("3 mins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => rideController.cancelRide(),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                      child: const Text("Cancel Ride"),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
