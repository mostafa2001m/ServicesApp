import 'package:demo_app/core/widgets/custom_app_bar.dart';
import 'package:demo_app/core/widgets/primary_button.dart';
import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:demo_app/features/services/presentaion/widgets/add_new_service/create_service_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddSurviceScreen extends StatelessWidget {
  const AddSurviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SurvicesController>().getAllServicesWithTheirInfo();
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<SurvicesController>(builder: (controller) {
            return listOfServicesToCreate(controller);
          }),
          const Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CustomAppBar(
                title: 'Add New Service',
              )),
          Positioned(
            bottom: 10.h,
            left: 30.w,
            right: 30.w,
            child: primaryButton('Done', 0, () {}),
          )
        ],
      ),
    );
  }
}
