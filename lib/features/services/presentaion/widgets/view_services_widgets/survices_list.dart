import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/features/services/data/models/service_model.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:demo_app/features/services/presentaion/widgets/view_services_widgets/services_sub_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

GetX<SurvicesController> viewSurviceComponent(
    BuildContext context, int index, ServiceModel service) {
  return GetX<SurvicesController>(builder: (controller) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (controller.selectedIndex.value == index) {
              controller.selectedIndex.value = -1;
            } else {
              controller.getSubServices(service.id);
              controller.selectedIndex.value = index;
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Container(
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.selectedIndex.value == index)
                    Container(
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: CustomTextStyles.homeServicesListText(
                            service.name,
                            color: AppColors.textColorDark)),
                  ),
                  if (controller.selectedIndex.value == index)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: CircleAvatar(
                          radius: 13.r,
                          backgroundColor: AppColors.primaryColor,
                          child: SvgPicture.asset(
                            Images.arrowDownIcon,
                            color: Colors.white,
                          )),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (controller.selectedIndex.value == index)
          subServicesList(controller, context)
      ],
    );
  });
}
