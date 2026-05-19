import 'package:get/get.dart';
import 'app_routes.dart';
import '../presentation/pages/auth/splash_page.dart';
import '../presentation/pages/auth/welcome_page.dart';
import '../presentation/pages/auth/login_page.dart';
import '../presentation/pages/auth/otp_page.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/ride/ride_options_screen.dart';
import '../presentation/pages/ride/waiting_for_driver_screen.dart';
import '../presentation/pages/ride/during_ride_screen.dart';
import '../presentation/pages/ride/ride_completed_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.rideOptions,
      page: () => const RideOptionsScreen(),
    ),
    GetPage(
      name: AppRoutes.waitingDriver,
      page: () => const WaitingForDriverScreen(),
    ),
    GetPage(
      name: AppRoutes.duringRide,
      page: () => const DuringRideScreen(),
    ),
    GetPage(
      name: AppRoutes.rideCompleted,
      page: () => const RideCompletedScreen(),
    ),
  ];
}
