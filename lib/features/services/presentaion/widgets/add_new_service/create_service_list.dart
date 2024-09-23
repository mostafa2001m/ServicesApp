import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/widgets/custom_check_box.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ListView listOfServicesToCreate(SurvicesController controller) {
  return ListView.builder(
    itemCount: controller.addServicesList.length,
    itemBuilder: (context, index) {
      final item = controller.addServicesList[index];
      return Column(
        children: [
          if (index == 0)
            SizedBox(
              height: 120.h,
            ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Container(
              color: AppColors.textColorLight,
              child: ExpansionTile(
                  iconColor: AppColors.primaryColor,
                  collapsedIconColor: AppColors.primaryColor,
                  title: Text(item.service.name),
                  children: [
                    Container(
                      color: AppColors.backgroundColor.withOpacity(0.5),
                      child: Column(
                        children:
                            item.subServices.asMap().entries.map((subService) {
                          int subIndex = subService.key; // Get the index
                          var service = subService.value;
                          var subServiceId = service.id;
                          return ExpansionTile(
                            iconColor: AppColors.errorColor,
                            collapsedIconColor: AppColors.errorColor,
                            leading: CustomCheckbox(
                              serviceIndex: index,
                              subServiceId: subServiceId,
                            ),
                            title: Text(service.name),
                            children: item.detailedServices
                                .where((detailedService) =>
                                    detailedService.subServiceId ==
                                    subServiceId) // Filter by subServiceId
                                .toList() // Convert the filtered Iterable to a List
                                .asMap()
                                .entries
                                .map((entry) {
                              int innerIndex = entry.key; // Get the index
                              var detailedService = entry.value;
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: ListTile(
                                  leading: CustomCheckbox(
                                    serviceIndex: index,
                                    subServiceId: subServiceId,
                                    detailedServiceId: detailedService.id,
                                  ),
                                  title: Text(detailedService.name),
                                ),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      );
    },
  );
}
