import 'package:flutteradvanced/data/network/app_api.dart';
import 'package:flutteradvanced/data/requests/login_request.dart';
import 'package:flutteradvanced/data/responses/auth_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppService _appService;

  RemoteDataSourceImplementer(this._appService);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) {
    return _appService.login(
      loginRequest.email,
      loginRequest.password,
      loginRequest.iemi,
      loginRequest.deviceType,
    );
  }
}
