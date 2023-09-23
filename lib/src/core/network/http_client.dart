import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:salon/src/core/network/network_info.dart';

import '../../dependency_injections/di_container.dart';
import '../../shared/constants/urls.dart';
import '../errors/exceptions.dart';
import '../store/store.dart';

///The below code is a Dart class that provides a generic HTTP client functionality using the Dio package. Here's a breakdown of the code:
/// The `AppHttpClient` class is a singleton class responsible for making HTTP requests.
/// The `innerClient` is an instance of the Dio class used to make the actual HTTP requests.
/// The `tryCatch` method is a helper method that wraps the HTTP request in a try///catch block and handles different types of exceptions and errors.
/// The `getRequest`, `postRequest`, `putRequest`, `patchRequest`, and `deleteRequest` methods are generic methods for making
/// GET, POST, PUT, PATCH, and DELETE requests, respectively. These methods call the `tryCatch` method internally.
/// The `AppInterceptors` class is a custom interceptor class that logs the API requests and responses using the `Logger` class.
/// The `onRequest`, `onResponse`, and `onError` methods of the `AppInterceptors` class are overridden to log the relevant information.
///To use this code, you need to have the necessary dependencies installed, such as the `dio` package for making HTTP requests and
///the `logger` package for logging. You can modify the code as per your specific requirements

typedef RequestFunc = Future<dynamic> Function();

// Singleton class for making HTTP requests
@LazySingleton()
class AppHttpClient {
  var dio = createDio(); // Create a Dio instance

  static var innerClient = createDio(); // Create another Dio instance

  CancelToken cancelToken = CancelToken(); // Token for cancelling requests

  void cancelRequest() {
    cancelToken.cancel(); // Cancel the current request
    cancelToken = CancelToken(); // Create a new token for future requests
  }

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(milliseconds: 15000),
        connectTimeout: const Duration(milliseconds: 15000),
        sendTimeout: const Duration(milliseconds: 15000),
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(dio), // Add custom interceptors to the Dio instance
    });

    return dio;
  }

  Future<void> setHeader(bool isUploading) async {
    // Set request timeout durations based on the debug mode
    innerClient.options.sendTimeout = isUploading
        ? const Duration(minutes: 10)
        : kDebugMode
            ? const Duration(milliseconds: 60000)
            : const Duration(milliseconds: 20000);
    innerClient.options.connectTimeout = isUploading
        ? const Duration(minutes: 10)
        : kDebugMode
            ? const Duration(milliseconds: 60000)
            : const Duration(milliseconds: 20000);
    innerClient.options.receiveTimeout = isUploading
        ? const Duration(minutes: 10)
        : kDebugMode
            ? const Duration(milliseconds: 60000)
            : const Duration(milliseconds: 20000);
    if (Store.token != '') {
      innerClient.options.headers['Authorization'] = 'Bearer ${Store.token}';
    }
  }

  // Generic function for handling HTTP requests with error handling
  Future<dynamic> tryCatch(
    RequestFunc func,
    String path, {
    bool cachedResponse = false,
    bool isPaginated = false,
    bool isUploading = false,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      // Set all headers
      await setHeader(isUploading);

      // Make the HTTP request using the provided function
      var response = await func();

      var json = response.data; // Extract the response data as JSON

      return json;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          // Handle different HTTP status codes
          case 400:
            throw BadRequestException(
                request: path,
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
          case 401:
            throw AuthenticationException(
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
          case 403:
            throw AuthenticationException(
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
          case 404:
            throw NotFoundException(
                request: path,
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
          case 500:
            throw InternalServerException(
                request: path,
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
          case 502:
            throw BadGatewayException(request: path, message: 'خطای سرور');
          case 504:
            throw BadGatewayException(request: path, message: 'خطای سرور');
          case 503:
            throw MaintainServerException(
                request: path,
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
          default:
            throw ServerException(
                request: path,
                message: e.response != null && e.response!.data != null
                    ? e.response!.data is Map
                        ? e.response!.data['message']
                        : e.response!.data
                    : e.message);
        }
      } else {
        NetworkInfo networkInfo = NetworkInfoImpl();
        if (await networkInfo.isConnected()) {
          throw BadGatewayException(request: path, message: 'خطای سرور');
        } else {
          throw NetworkException();
        }
      }
    } catch (err) {
      throw AppException();
    }
  }

  // Generic function for making GET requests
  Future<dynamic> get<T, M>(
    String path, {
    bool cachedResponse = false,
    bool isPaginated = false,
    Map<String, dynamic>? queryParams,
  }) async {
    return await tryCatch(
        () => innerClient.get(
              Urls.baseUrl + path,
              cancelToken: cancelToken,
              queryParameters: queryParams,
            ),
        path,
        cachedResponse: cachedResponse,
        isPaginated: isPaginated);
  }

  // Generic function for making POST requests
  Future<dynamic> post(String path,
      {bool cachedResponse = false,
      bool isPaginated = false,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? data,
      FormData? formData,
      File? file}) async {
    FormData? requestBody;
    if (file != null) {
      var fileName = file.path.split('/').last;
      requestBody = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
    }
    return await tryCatch(
        () => innerClient.post(
              Urls.baseUrl + path,
              cancelToken: cancelToken,
              queryParameters: queryParams,
              data: formData ?? requestBody ?? data,
            ),
        path,
        isUploading: formData != null,
        cachedResponse: cachedResponse,
        isPaginated: isPaginated);
  }

  // Generic function for making PUT requests
  Future<dynamic> put(
    String path, {
    bool cachedResponse = false,
    bool isPaginated = false,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    return await tryCatch(
        () => innerClient.put(
              Urls.baseUrl + path,
              cancelToken: cancelToken,
              queryParameters: queryParams,
              data: data,
            ),
        path,
        cachedResponse: cachedResponse,
        isPaginated: isPaginated);
  }

  // Generic function for making PATCH requests
  Future<dynamic> patch(
    String path, {
    bool cachedResponse = false,
    bool isPaginated = false,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    return await tryCatch(
        () => innerClient.patch(
              Urls.baseUrl + path,
              cancelToken: cancelToken,
              queryParameters: queryParams,
              data: formData ?? data,
            ),
        path,
        cachedResponse: cachedResponse,
        isPaginated: isPaginated);
  }

  // Generic function for making DELETE requests
  Future<dynamic> delete(
    String path, {
    bool cachedResponse = false,
    bool isPaginated = false,
    Map<String, dynamic>? queryParams,
  }) async {
    return await tryCatch(
        () => innerClient.delete(
              Urls.baseUrl + path,
              cancelToken: cancelToken,
              queryParameters: queryParams,
            ),
        path,
        cachedResponse: cachedResponse,
        isPaginated: isPaginated);
  }
}

// Custom interceptor for logging API requests and responses
class AppInterceptors extends InterceptorsWrapper {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      getIt<Logger>().v('''
        =========== API Request - Start ===========
        URI ${options.uri}
        METHOD ${options.method}
        HEADERS ${options.headers} 
        BODY ${options.data}
        =========== API Request - End ===========
        ''');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      getIt<Logger>().i('''
        =========== API Response - Start ===========
        URI ${response.requestOptions.uri}
        STATUS CODE ${response.statusCode} 
        METHOD ${response.requestOptions.method}
        BODY ${response.data}
        =========== API Response - End ===========
        ''');
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      if (kDebugMode) {
        getIt<Logger>().e('''
        =========== API Error - Start ===========
        URI ${err.requestOptions.uri}
        STATUS CODE ${err.response?.statusCode} 
        ERROR ${err.response}
        =========== API Error - End ===========
        ''');
      }
    } else {
      if (kDebugMode) {
        getIt<Logger>().e('''
        =========== API Error - Start ===========
        URI ${err.requestOptions.uri}
        STATUS CODE 
        ERROR 
        =========== API Error - End ===========
        ''');
      }
    }

    return handler.next(err);
  }
}
