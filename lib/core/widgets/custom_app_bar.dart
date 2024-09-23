import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var language = box.read(
      'languageCode',
    );
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 24.w),
        child: SafeArea(
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              CustomTextStyles.headlineBoldText(title, color: Colors.white),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    Images.arrowBackIcon,
                    color: Colors.white,
                    height: 20.h,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
