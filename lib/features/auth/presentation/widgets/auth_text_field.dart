import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/features/auth/presentation/view%20model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Padding primaryTextField(TextEditingController textController, String icon,
    String hint, bool isPassword, bool isRequired) {
  // Fetch the AuthController
  var controller = Get.find<AuthController>();

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 3), // Offset in X and Y direction
          ),
        ],
      ),
      child: TextFormField(
        controller: textController, // Assign the text controller
        obscureText: isPassword
            ? controller
                .isPasswordVisible.value // Use Obx only around this part
            : false,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isPassword ? 13.w : 10.w), // Add padding if needed
            child: SvgPicture.asset(
              icon,
              color: AppColors.primaryColor,
              width: 10.w, // You can adjust the size here
              height: 10.h,
            ),
          ),
          suffixIcon: isPassword
              ? Obx(() => GestureDetector(
                    onTap: () {
                      controller
                          .togglePasswordVisibility(); // Toggle visibility
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: SvgPicture.asset(
                        controller.isPasswordVisible.value
                            ? Images.viewPasswordIcon
                            : Images.hidePasswordIcon,
                      ),
                    ),
                  ))
              : null,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h), // Adjust height here
        ),
        validator: isRequired
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $hint';
                }
                return null;
              }
            : null,
      ),
    ),
  );
}
