

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioNetwork with DioMixin implements Dio {
  var durasi = const Duration(milliseconds: 5000);
  DioNetwork._([BaseOptions? options]) {
    options = BaseOptions(
      connectTimeout: durasi,
      sendTimeout: durasi,
      receiveTimeout: durasi,
    );

    this.options = options;

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          handler.next(error);
        },
      ),
    );

    httpClientAdapter = IOHttpClientAdapter();
  }

  static final _instance = DioNetwork._();

  static DioNetwork get instance => _instance;


}
