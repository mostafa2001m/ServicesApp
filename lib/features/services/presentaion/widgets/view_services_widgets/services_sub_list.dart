import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/custom_text_styles.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:demo_app/features/services/presentaion/widgets/view_services_widgets/detailed_services_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

ListView subServicesList(SurvicesController controller, BuildContext context) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.subServices.length,
      padding: EdgeInsets.only(
        left: Directionality.of(context) == TextDirection.ltr ? 0 : 24.w,
        right: Directionality.of(context) == TextDirection.rtl ? 0 : 24.w,
      ),
      itemBuilder: (context, i) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                if (controller.selectedInnerIndex.value == i) {
                  controller.selectedInnerIndex.value = -1;
                  controller.update();
                } else {
                  controller.getDetailedServices(controller.subServices[i].id);
                  controller.selectedInnerIndex.value = i;
                  controller.update();
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
                      if (controller.selectedInnerIndex.value == i)
                        Container(
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: AppColors.errorColor,
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
                                controller.subServices[i].name,
                                color: AppColors.textColorDark)),
                      ),
                      if (controller.selectedInnerIndex.value == i)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: CircleAvatar(
                              radius: 13.r,
                              backgroundColor: AppColors.errorColor,
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
            if (controller.selectedInnerIndex.value == i)
              detailedSurvicesContainer(controller),
          ],
        );
      });
}
