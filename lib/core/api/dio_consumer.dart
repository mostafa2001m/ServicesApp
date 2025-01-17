import 'package:demo_app/core/api/api_consumer.dart';
import 'package:demo_app/core/api/end_points.dart';
import 'package:demo_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true));
  }
  @override
  Future delete(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final responce =
          await dio.delete(path, data: data, queryParameters: queryParameters);
      return responce.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final responce =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return responce.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final responce =
          await dio.patch(path, data: data, queryParameters: queryParameters);
      return responce.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final responce = await dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: headers ?? {},
          ));
      return responce.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
