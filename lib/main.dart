import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart'; // TEMP_DISABLED_FIREBASE
import 'core/services/hive_service.dart';
import 'core/themes/app_theme.dart';
import 'core/translations/app_translations.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'bindings/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  final hiveService = HiveService();
  await hiveService.init();

  // Initialize Firebase (Placeholder for actual config)
  // await Firebase.initializeApp( // TEMP_DISABLED_FIREBASE
  //   options: DefaultFirebaseOptions.currentPlatform, // TEMP_DISABLED_FIREBASE
  // ); // TEMP_DISABLED_FIREBASE

  runApp(const WaselApp());
}

class WaselApp extends StatelessWidget {
  const WaselApp({super.key});

  @override
  Widget build(BuildContext context) {
    final hiveService = Get.put(HiveService());

    return GetMaterialApp(
      title: 'Wasel / واصل',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // Localization
      translations: AppTranslations(),
      locale: Locale(hiveService.getLanguage()),
      fallbackLocale: const Locale('ar'),

      // Routing
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),

      // Right-to-Left support handled by GetX and Locale
      builder: (context, child) {
        return Directionality(
          textDirection: Get.locale?.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}
