import 'package:dartz/dartz.dart';
import 'package:flutteradvanced/app/functions.dart';
import 'package:flutteradvanced/data/network/failure.dart';
import 'package:flutteradvanced/data/requests/login_request.dart';
import 'package:flutteradvanced/data/responses/auth_response.dart';
import 'package:flutteradvanced/domain/models/device_info.dart';
import 'package:flutteradvanced/domain/repositories/login_repository.dart';

abstract class LoginUseCase {
  Future<Either<Failure, AuthenticationResponse>> execute(
      LoginUseCaseInput loginUseCaseInput);
}

class LoginUseCaseImpl implements LoginUseCase {
  LoginRepository loginRepository;
  LoginUseCaseImpl(this.loginRepository);
  @override
  Future<Either<Failure, AuthenticationResponse>> execute(
      LoginUseCaseInput loginUseCaseInput) async {
    DeviceInfo deviceInfo = await getDeviceInfo();
    return await loginRepository.login(
      LoginRequest(
        loginUseCaseInput.email,
        loginUseCaseInput.password,
        deviceInfo.indentifier,
        deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
