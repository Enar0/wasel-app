import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../controllers/ride_controller.dart';

class RideOptionsScreen extends StatelessWidget {
  const RideOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rideController = Get.find<RideController>();

    // For demo, set mock locations if empty
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (rideController.pickupLocation.value == null) {
        rideController.setPickup(const LatLng(32.8872, 13.1913), 'Tripoli Center');
        rideController.setDestination(const LatLng(32.8900, 13.2000), 'Mitiga Airport');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('confirm_ride'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildRideTypeCard(
                  context,
                  rideController,
                  'economy',
                  'economy'.tr,
                  Icons.directions_car,
                  '5 min',
                  AppColors.primary,
                ),
                _buildRideTypeCard(
                  context,
                  rideController,
                  'family',
                  'family'.tr,
                  Icons.people,
                  '8 min',
                  Colors.green,
                ),
                _buildRideTypeCard(
                  context,
                  rideController,
                  'delivery',
                  'delivery'.tr,
                  Icons.delivery_dining,
                  '10 min',
                  Colors.orange,
                ),
              ],
            ),
          ),

          Container(
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
                    Row(
                      children: [
                        const Icon(Icons.money, color: Colors.green),
                        const SizedBox(width: 8),
                        Text('cash'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Obx(() => Text(
                      '${rideController.estimatedFare.value.toStringAsFixed(2)} LYD',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
                const SizedBox(height: 16),
                // Payment Gateway Placeholders
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _PaymentChip(label: 'T-LYNC'),
                      _PaymentChip(label: 'Plutu'),
                      _PaymentChip(label: 'Sadad'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => rideController.requestRide(),
                  child: Text('confirm_ride'.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRideTypeCard(
    BuildContext context,
    RideController controller,
    String type,
    String title,
    IconData icon,
    String eta,
    Color color,
  ) {
    return Obx(() {
      bool isSelected = controller.selectedRideType.value == type;
      return GestureDetector(
        onTap: () {
          controller.selectedRideType.value = type;
          controller.calculateFare();
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? color : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(eta, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
              if (isSelected) Icon(Icons.check_circle, color: color),
            ],
          ),
        ),
      );
    });
  }
}

class _PaymentChip extends StatelessWidget {
  final String label;
  const _PaymentChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}
