import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/core/widgets/primary_button.dart';
import 'package:demo_app/features/auth/presentation/view%20model/auth_controller.dart';
import 'package:demo_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  var controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            primaryTextField(controller.userNameController, Images.usernameIcon,
                "usernameOrMobile".tr, false, true),
            primaryTextField(controller.passwordController, Images.passwordIcon,
                "password".tr, true, true),
            Align(
                alignment: Alignment.centerRight,
                child: CustomTextStyles.smallText("forgotPassword".tr,
                    color: AppColors.primaryColor)),
            Obx(() {
              if (controller.isLoading.value) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: LoadingAnimationWidget.dotsTriangle(
                      color: AppColors.primaryColor, size: 40.w),
                );
              } else {
                return primaryButton("login".tr, 30, () {
                  if (formKey.currentState!.validate()) {
                    controller.loginUser();
                  }
                });
              }
            }),
            CustomTextStyles.termsAndConditionTextText(
              "termsAndConditionsText".tr,
              color: AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
