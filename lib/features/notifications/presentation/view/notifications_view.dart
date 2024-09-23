import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/widgets/custom_app_bar.dart';
import 'package:demo_app/core/widgets/loader.dart';
import 'package:demo_app/features/notifications/presentation/view%20model/notifications_controller.dart';
import 'package:demo_app/features/notifications/presentation/widgets/notifications_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetX<NotificationsController>(
              init: NotificationsController(),
              builder: (controller) {
                if (controller.isLoading.value) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white60,
                    child: const Center(
                      child: LoaderCircle(),
                    ),
                  );
                } else {
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.notificationList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.notificationList.length) {
                        final notification = controller.notificationList[index];
                        return notificationCardView(index, notification);
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: Center(
                            child: LoadingAnimationWidget.inkDrop(
                                color: AppColors.primaryColor, size: 30.h),
                          ),
                        );
                      }
                    },
                  );
                }
              }),
          const Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CustomAppBar(
                title: 'Notifications',
              ))
        ],
      ),
    );
  }
}
