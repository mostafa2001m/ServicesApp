import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/app_strings.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/widgets/primary_button.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:demo_app/features/services/presentaion/view/add_survice_screen.dart';
import 'package:demo_app/features/services/presentaion/widgets/view_services_widgets/survices_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesListWidget extends StatelessWidget {
  const ServicesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SurvicesController>().getAllServices();
    return GetBuilder<SurvicesController>(builder: (controller) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor, // Button color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Text(
                        "showMyTasks".tr,
                        style: GoogleFonts.poppins(),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextStyles.headlineNormalText("survices".tr),
                    Container(
                      height: 5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CustomTextStyles.homeServicesListText(
                  "facilityServices".tr,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    return viewSurviceComponent(
                        context, index, controller.services[index]);
                  },
                ),
              ),
              primaryButton("linkNewSurviceButton".tr, 8, () {
                Get.to(const AddSurviceScreen());
              })
            ],
          ),
        ),
      );
    });
  }
}
