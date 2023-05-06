import 'package:dio/dio.dart';
import 'package:pokedex/data/service/api/api_endpoints.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String? baseUrl}) = _ClientApi;

  /// ************************************
  /// AUTH ENDPOINTS
  /// ************************************

  @POST(ApiEndpoints.login)
  Future<String?> sendPhoneNumber({@Body() required Map<String, dynamic> payload});

  @POST(ApiEndpoints.verifyCode)
  Future<String?> sendSms({@Body() required Map<String, dynamic> payload});
}
