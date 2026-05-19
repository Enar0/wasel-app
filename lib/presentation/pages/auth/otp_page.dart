import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  final authController = Get.find<AuthController>();
  final String phoneNumber = Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify_otp'.tr),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'verify'.tr,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${'otp_sent'.tr} $phoneNumber',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 8),
              maxLength: 6,
              decoration: InputDecoration(
                hintText: '000000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Spacer(),
            Obx(() => ElevatedButton(
              onPressed: authController.isLoading.value
                  ? null
                  : () {
                      if (_otpController.text.length == 6) {
                        authController.verifyOtp(_otpController.text);
                      } else {
                        Get.snackbar('Error', 'Please enter 6-digit OTP');
                      }
                    },
              child: authController.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text('verify'.tr),
            )),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
