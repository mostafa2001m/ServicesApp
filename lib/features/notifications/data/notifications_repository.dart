import 'package:demo_app/core/api/dio_consumer.dart';
import 'package:demo_app/core/api/end_points.dart';
import 'package:demo_app/features/notifications/data/models/notification_model.dart';
import 'package:dio/dio.dart';

class NotificationsRepository {
  DioConsumer dio = DioConsumer(dio: Dio());

  getNotifications(int skip,Function(List<NotificationModel>) onSuccess,
      Function(String errorMessage) onError,) async {
    try {
      dynamic response =
          await dio.get(EndPoints.notificationsUrl, queryParameters: {
        'limit': 10,
        'skip': skip,
      });
      if (response.containsKey('products')) {
        List<NotificationModel> notifications = List<NotificationModel>.from(
            response['products']
                .map((data) => NotificationModel.fromJson(data)));
        onSuccess(notifications);
      } else {
        onError(response['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      onError(e.toString());
    }
  }
}
