import 'package:get/get.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/hive_service.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final HiveService _hiveService = Get.find<HiveService>();

  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  final RxBool isLoading = false.obs;
  final RxString verificationId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLocalUser();
  }

  void _loadLocalUser() {
    final userData = _hiveService.getUser();
    if (userData != null) {
      currentUser.value = UserModel.fromMap(userData);
    }
  }

  Future<void> loginWithPhone(String phoneNumber) async {
    isLoading.value = true;
    try {
      await _authService.verifyPhone(
        phoneNumber: phoneNumber,
        codeSent: (id) {
          verificationId.value = id;
          isLoading.value = false;
          Get.toNamed(AppRoutes.otp, arguments: phoneNumber);
        },
        verificationFailed: (e) {
          isLoading.value = false;
          // Use a generic error message if e.message is not available
          String message = 'Verification failed'; // TEMP_DISABLED_FIREBASE
          try {
            message = (e as dynamic).message ?? message;
          } catch (_) {}
          Get.snackbar('Error', message);
        },
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;
    try {
      // For mock purposes, we just simulate success
      await Future.delayed(const Duration(seconds: 1));

      // Create mock user
      final user = UserModel(
        uid: 'mock_uid_${DateTime.now().millisecondsSinceEpoch}',
        phoneNumber: Get.arguments as String,
        fullName: 'New User',
        userType: 'rider',
        createdAt: DateTime.now(),
        language: _hiveService.getLanguage(),
      );

      await _hiveService.saveUser(user.toMap());
      currentUser.value = user;

      isLoading.value = false;
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  void logout() async {
    await _authService.signOut();
    await _hiveService.clearUser();
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.welcome);
  }
}
