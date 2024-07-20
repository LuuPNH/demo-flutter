import 'package:data/network/base_url.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'http_logging_interceptor.dart';

@lazySingleton
class DioRequest {
  final EnvironmentConfig env;
  final Dio dio;
  final BaseUrl baseUrl;
  final LocalDataRepository localDataRepository;

  DioRequest(
    this.dio,
    this.env,
    this.baseUrl,
    this.localDataRepository,
  ) {
    if (env.httpEnvironment == Environment.dev) {
      dio.interceptors.add(HttpLoggingViewInterceptor());
    }
    dio.options.baseUrl = baseUrl.url;
  }

  Future<Response> request({
    required Method method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
  }) async {
    if (options == null) {
      dio.options.headers['Content-Type'] = 'application/json';
    }
    try {
      Future<Response> response;
      if (method is POST) {
        response =
            dio.post(method.path, data: data, queryParameters: queryParameters, options: options);
      } else if (method is GET) {
        response = dio.get(method.path, queryParameters: queryParameters, options: options);
      } else if (method is PUT) {
        response =
            dio.put(method.path, data: data, queryParameters: queryParameters, options: options);
      } else if (method is DELETE) {
        response =
            dio.delete(method.path, data: data, queryParameters: queryParameters, options: options);
      } else if (method is PATCH) {
        response =
            dio.patch(method.path, data: data, queryParameters: queryParameters, options: options);
      } else {
        throw 'no support method ${method.runtimeType}';
      }
      return await response;
    } catch (e) {
      if (e is DioException) {
        if (e.type != DioExceptionType.unknown) {
          if (e.response?.data != null) {
            throw e.response?.data["message"];
          }
          throw e.response?.statusMessage ?? e.message ?? e;
        }
      }
      rethrow;
    }
  }
}

abstract class Method {
  String path;

  Method(this.path);

  void setPath(String key, String value) {
    path = path.replaceAll(key, value);
  }

  Method addPath(String path) {
    this.path += path;
    return this;
  }
}

class POST extends Method {
  POST(super.url);
}

class GET extends Method {
  GET(super.url);
}

class PUT extends Method {
  PUT(super.url);
}

class PATCH extends Method {
  PATCH(super.url);
}

class DELETE extends Method {
  DELETE(super.url);
}
