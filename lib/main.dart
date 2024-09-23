import 'package:demo_app/core/localization/language.dart';
import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/features/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

dynamic langValue = const Locale('en', null);
final box = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  if (box.read('languageCode') != null) {
    langValue = Locale(box.read('languageCode'), null);
  } else {
    langValue = const Locale('en', 'EN');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
            defaultTransition: Transition.fadeIn,
            translations: Languages(),
            locale: langValue,
            home: const LoginScreen(),
          );
        });
  }
}
