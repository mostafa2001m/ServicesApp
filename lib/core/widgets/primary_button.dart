import 'package:demo_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Padding primaryButton(String title, double verticalPadding, Function() onPressed) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70.w),
        backgroundColor: AppColors.primaryColor, // Button color
        foregroundColor: AppColors.textColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: Text(title, style: GoogleFonts.poppins(fontSize: 18.sp)),
    ),
  );
}
