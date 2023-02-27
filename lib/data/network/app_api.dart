import 'package:dio/dio.dart';
import 'package:flutteradvanced/app/constants.dart';
import 'package:flutteradvanced/data/responses/auth_response.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

///APIs class is for api tags
class ApiEndPoints {
  static const String login = '/customers/login';
}

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @POST(ApiEndPoints.login)
  Future<AuthenticationResponse> login();
}
