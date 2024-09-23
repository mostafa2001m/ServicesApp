import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding detailedSurvicesContainer(SurvicesController controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Container(
      width: double.infinity,
      // height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Changes the position of the shadow
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.detailedServices.map<Widget>((subService) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: CustomTextStyles.homeServicesListText(subService.name,
                  color: AppColors.textColorDark),
            );
          }).toList(),
        ),
      ),
    ),
  );
}
