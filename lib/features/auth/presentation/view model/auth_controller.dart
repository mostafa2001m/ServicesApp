import 'package:demo_app/core/widgets/custom_snackbar.dart';
import 'package:demo_app/features/auth/data/auth_repository.dart';
import 'package:demo_app/features/auth/data/models/user_model.dart';
import 'package:demo_app/features/services/presentaion/view/view_services_screen.dart';
import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  var userNameController = TextEditingController(text: 'emilys');
  var passwordController = TextEditingController(text: 'emilyspass');
  RxBool isLoading = false.obs;
  AuthRepository authRepo = AuthRepository();
   bool isArabic = false;
  bool isEnglish = true;
  String langCode = 'en';

  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  loginUser() {
    isLoading.value = true;
    authRepo.loginUser(
        UserModel(
            userName: userNameController.text,
            password: passwordController.text), (success) {
      customSnackBar('Success', success, false);
      Get.offAll(const ViewServicesScreen());
    }, (error) {
      customSnackBar('Error'.tr, error, true);
    });
    isLoading.value = false;
  }

  getLanguage() {
    var language = box.read(
      'languageCode',
    );
    if (language != null && language == const Locale('en').languageCode) {
      isArabic = false;
      isEnglish = true;
    } else {
      isArabic = true;
      isEnglish = false;
    }
    update();
  }

  void changeLanguage(Locale locale) {
    var language = box.read(
      'languageCode',
    );
    langCode = locale.languageCode;
    if (language != null && language == const Locale('en').languageCode) {
      isArabic = false;
      isEnglish = true;
    } else {
      isArabic = true;
      isEnglish = false;
    }
    update();
    var newLocale = locale;
    Get.updateLocale(newLocale);
    box.write('languageCode', langCode);
    Get.back();
  }
}
