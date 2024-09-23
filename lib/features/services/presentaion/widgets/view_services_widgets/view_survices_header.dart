import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/app_strings.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/features/notifications/presentation/view/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ViewSurvicesHeader extends StatelessWidget {
  const ViewSurvicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 95.w,
                    child: CustomTextStyles.homeHederText(AppStrings.cliniq,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '100%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    // flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(const NotificationsView());
                            },
                            child:
                                const Icon(Icons.message, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, color: Colors.white, size: 25),
                  SizedBox(
                    width: 50.w,
                  ),
                  const Icon(Icons.business, color: Colors.white, size: 25),
                  SizedBox(
                    width: 50.w,
                  ),
                  const Icon(Icons.handshake, color: Colors.white, size: 25),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
