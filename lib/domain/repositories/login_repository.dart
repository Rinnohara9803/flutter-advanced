import 'package:dartz/dartz.dart';
import 'package:flutteradvanced/data/datasource/remote_data_source.dart';
import 'package:flutteradvanced/data/network/error_hander.dart';
import 'package:flutteradvanced/data/network/failure.dart';
import 'package:flutteradvanced/data/network/network_info.dart';
import 'package:flutteradvanced/data/requests/login_request.dart';
import 'package:flutteradvanced/data/responses/auth_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, AuthenticationResponse>> login(
      LoginRequest loginRequest);
}

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;
  LoginRepositoryImpl(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, AuthenticationResponse>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isNetworkAvailable) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.success) {
          return Right(response);
        } else {
          return Left(Failure(response.status ?? ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultCode));
        }
      } catch (e) {
        return Left(ErrorHandlerImpl.handler(e).failure);
      }
    }
    return Left(
      DataSource.noInternetConnection.getFailure(),
    );
  }
}
