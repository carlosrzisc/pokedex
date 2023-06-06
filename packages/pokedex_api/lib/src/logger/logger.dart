import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex_api/src/logger/models.dart';
import 'package:pokedex_api/src/logger/utils.dart';

class NetworkLogger {
  static void logResponse(dynamic res) {
    if (res is Response) {
      final req = res.requestOptions;
      final statusCode = res.statusCode;

      final query = LoggerUtils.createQuery(req.queryParameters);
      final method = req.method;
      final path = '${req.path}$query';

      final result = ResponseData(
        path: path,
        method: method,
        data: res.data,
        statusCode: statusCode,
      ).toJson();

      DebugLogger.loggit(encodeJson(result), name: 'Response');
    } else {
      DebugLogger.loggit(encodeJson(res), name: 'Response');
    }
  }

  static void logRequest(
    String method,
    String url, {
    Map<String, dynamic>? query,
    dynamic body,
    dynamic headers,
  }) {
    final queryString = LoggerUtils.createQuery(query);
    final path = '$url$queryString';

    final logData = RequestData(
      method: method,
      path: path,
      body: body,
      headers: headers,
    ).toJson();

    final result = encodeJson(logData);

    DebugLogger.loggit(result, name: 'Request');
  }

  static void logError(dynamic e) {
    if (e is DioError) {
      _handleDioError(e);
    } else {
      DebugLogger.loggit(e.toString(), name: 'Error');
    }
  }

  static String encodeJson(dynamic data) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }

  static void _handleDioError(DioError e) {
    final res = e.response;
    final req = e.requestOptions;

    final query = LoggerUtils.createQuery(req.queryParameters);
    final path = '${req.path}$query';
    final method = req.method.toUpperCase();

    if (res != null) {
      final error = RequestError(
        path: path,
        method: method,
        statusCode: res.statusCode,
        statusMessage: res.statusMessage,
        data: res.data,
      ).toJson();

      DebugLogger.loggit(encodeJson(error), name: 'RequestError');
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      DebugLogger.loggit(e.message ?? 'Error message', name: 'Error');
    }
  }
}

class DebugLogger {
  static void loggit(String content, {String name = ''}) {
    log(
      '\x1B$content\x1B',
      name: name,
      time: DateTime.now(),
    );
  }
}
