import 'package:demo_app/core/utils/app_colors.dart';
import 'package:get/get.dart';

customSnackBar(String title, String message, bool isError) {
  return Get.snackbar(title, message,
      backgroundColor: isError ? AppColors.errorColor : AppColors.successColor,
      colorText: AppColors.textColorLight,
      snackPosition: SnackPosition.BOTTOM);
}
