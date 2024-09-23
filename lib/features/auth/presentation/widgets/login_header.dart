import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/features/auth/presentation/widgets/change_language_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Column loginHeader(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextStyles.headlineBoldText("login".tr,
              color: AppColors.primaryColor),
          GestureDetector(
            onTap: () {
              showSettingsPopup(context);
            },
            child: SvgPicture.asset(
              Images.changeLanguageIcon,
              height: 60.h,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 150.h,
      ),
      SvgPicture.asset(
        Images.logo,
        height: 60.h,
      ),
      SizedBox(height: 60.h),
    ],
  );
}
