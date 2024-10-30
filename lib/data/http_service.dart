import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:json_parsing_tutorial/util/constants.dart';

class HttpService {
  final Logger _logger = Logger();

  late Dio _dio;

  HttpService() {
    // creating an instance of dio
    _dio = Dio(
      BaseOptions(baseUrl: BASE_URL),
    );

    // initializing http interceptors
    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioException catch (e) {
      _logger.e(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          _logger.i("${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          _logger.i(response.data);
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          _logger.e(error);
          return handler.next(error);
        },
      ),
    );
  }
}
