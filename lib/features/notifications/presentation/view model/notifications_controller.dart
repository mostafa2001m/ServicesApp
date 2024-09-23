import 'package:demo_app/core/widgets/custom_snackbar.dart';
import 'package:demo_app/features/notifications/data/models/notification_model.dart';
import 'package:demo_app/features/notifications/data/notifications_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  List<NotificationModel> notificationList = [];
  NotificationsRepository notificationsRepository = NotificationsRepository();
  final scrollController = ScrollController();
  int skip = 0;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('ahsgvd');
    getNotifications();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getMoreNotifications();
      }
    });
  }

  getNotifications() async {
    isLoading.value = true;
    update();
    if (skip > 0) {
      skip += 10;
    }
    await notificationsRepository.getNotifications(skip, (notifications) {
      notificationList = notifications;
      update();
    }, (error) {
      customSnackBar('Error'.tr, error, true);
    });
    print('xxxasdsd${notificationList.length}');
    isLoading.value = false;
    update();
  }

  getMoreNotifications() async {
    skip += 10;
    await notificationsRepository.getNotifications(skip, (notifications) {
      notificationList.addAll(notifications);
      update();
    }, (error) {
      customSnackBar('Error'.tr, error, true);
    });
    print('xxxasdsd${notificationList.length}');
  }
}
