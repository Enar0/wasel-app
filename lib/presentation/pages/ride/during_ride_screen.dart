import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../controllers/ride_controller.dart';

class DuringRideScreen extends StatelessWidget {
  const DuringRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rideController = Get.find<RideController>();

    return Scaffold(
      body: Stack(
        children: [
          // Map Placeholder with Polyline
          Container(
            color: Colors.grey[100],
            child: const Center(child: Text("Live Trip Tracking Map")),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoColumn("Time Left", "12 min"),
                      _buildInfoColumn("Distance", "4.2 km"),
                      _buildInfoColumn("Destination", "Airport Rd"),
                    ],
                  ),
                  const Divider(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => rideController.shareRideTracking(),
                          icon: const Icon(Icons.share),
                          label: const Text("Share"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {}, // Emergency
                          icon: const Icon(Icons.security),
                          label: const Text("Safety"),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.primary),
                        SizedBox(width: 12),
                        Expanded(child: Text("Please have cash ready for the driver", style: TextStyle(fontSize: 12))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Demo Complete Button
                  TextButton(
                    onPressed: () => rideController.completeRide(),
                    child: const Text("DEBUG: Complete Ride"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
