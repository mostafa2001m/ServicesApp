import 'package:demo_app/core/api/dio_consumer.dart';
import 'package:demo_app/core/api/end_points.dart';
import 'package:demo_app/core/utils/app_strings.dart';
import 'package:demo_app/features/auth/data/models/user_model.dart';
import 'package:demo_app/main.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  DioConsumer dio = DioConsumer(dio: Dio());

  Future<void> loginUser(
      UserModel user,
      Function(String successMessage) onSuccess,
      Function(String errorMessage) onError) async {
    try {
      // Await the response from Dio's post request
        dynamic response =
            await dio.post(EndPoints.loginUrl, data: user.toJson());

      // Check if the response contains the 'accessToken'
      if (response != null && response.containsKey('accessToken')) {
        saveTokens(response['accessToken'], response['refreshToken']);
        onSuccess('Login Successfully');
      } else {
        onError(response.data['message'] ?? 'Login failed');
      }
    } catch (e) {
      print(e);
      // Handle error
      onError(e.toString());
    }
  }
  void saveTokens(String accessToken, String refreshToken) {
  box.write(AppStrings.accessTokenStorageKey, accessToken);
  box.write(AppStrings.refreshTokenStorageKey, refreshToken);
}
}
