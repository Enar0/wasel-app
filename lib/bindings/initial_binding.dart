import 'package:get/get.dart';
import '../presentation/controllers/auth_controller.dart';
import '../presentation/controllers/ride_controller.dart';
import '../core/services/auth_service.dart';
import '../core/services/hive_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HiveService(), permanent: true);
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RideController(), fenix: true);
  }
}
