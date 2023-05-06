import 'dart:convert';

class RequestData {
  RequestData({
    required this.path,
    required this.method,
    this.body,
    this.headers,
  });
  final String path;
  final String method;
  final dynamic body;
  final dynamic headers;

  Map<String, dynamic> toJson() {
    late dynamic decodedBody;
    if (body == null) {
      decodedBody = '';
    } else if (body is String) {
      try {
        decodedBody = jsonDecode(body as String);
      } on FormatException {
        decodedBody = body.toString();
      } on Exception {
        decodedBody = body.toString();
      }
    } else {
      decodedBody = body.toString();
    }
    return {
      'path': path,
      'method': method,
      'timeStamp': DateTime.now().toIso8601String(),
      if (method != 'GET') 'body': decodedBody,
      'headers': headers,
    };
  }
}

class RequestError {
  RequestError({
    this.path,
    this.data,
    this.statusCode,
    this.method,
    this.statusMessage,
  });
  final String? path;
  final dynamic data;
  final int? statusCode;
  final String? statusMessage;
  final String? method;

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'method': method,
      'statusCode': statusCode,
      'statusMessage': statusMessage,
      'timeStamp': DateTime.now().toIso8601String(),
      'data': data,
    };
  }
}

class ResponseData {
  ResponseData({
    required this.path,
    required this.method,
    required this.data,
    required this.statusCode,
  });
  final String path;
  final String method;
  final int? statusCode;
  final dynamic data;

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'method': method.toUpperCase(),
      'statusCode': statusCode,
      'timeStamp': DateTime.now().toIso8601String(),
      'data': data,
    };
  }
}
