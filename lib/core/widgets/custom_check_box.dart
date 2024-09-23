import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:demo_app/features/services/presentaion/widgets/view_services_widgets/suvices_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final int serviceIndex;
  final String subServiceId;
  final String? detailedServiceId;
  const CustomCheckbox({
    super.key,
    required this.subServiceId,
    this.detailedServiceId,
    required this.serviceIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurvicesController>(builder: (controller) {
     
      bool isChecked = controller.checkIfSelected(
          serviceIndex, subServiceId, detailedServiceId);
      return GestureDetector(
        onTap: () {
          controller.selectServicesToAdd(
              detailedServiceId, subServiceId, serviceIndex);
        },
        child: Container(
          width: 20.0.w,
          height: 20.0.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: isChecked ? AppColors.primaryColor : Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: isChecked
                ? Container(
                    width: 10.0.w,
                    height: 10.0.h,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  )
                : const SizedBox.shrink(), 
          ),
        ),
      );
    });
  }
}
