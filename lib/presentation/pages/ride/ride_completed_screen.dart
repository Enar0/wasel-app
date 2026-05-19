import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../controllers/ride_controller.dart';
import '../../../routes/app_routes.dart';

class RideCompletedScreen extends StatelessWidget {
  const RideCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rideController = Get.find<RideController>();
    final breakdown = rideController.fareBreakdown.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('trip_completed'.tr),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: AppColors.success, size: 80),
            const SizedBox(height: 16),
            Text(
              'trip_completed'.tr,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Fare Breakdown Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('fare_breakdown'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(height: 24),
                  _buildFareRow('base_fare'.tr, breakdown?.baseFare ?? 0),
                  _buildFareRow('distance_fare'.tr, breakdown?.distanceFare ?? 0),
                  _buildFareRow('time_fare'.tr, breakdown?.timeFare ?? 0),
                  _buildFareRow('service_fee'.tr, breakdown?.serviceFee ?? 0),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('total'.tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('${breakdown?.total.toStringAsFixed(2)} LYD',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            Text('rate_driver'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => const Icon(Icons.star_border, size: 40, color: AppColors.accent)),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.home),
              child: Text('done'.tr),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFareRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text('${amount.toStringAsFixed(2)} LYD'),
        ],
      ),
    );
  }
}
