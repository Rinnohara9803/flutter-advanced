import 'dart:async';

import 'package:flutteradvanced/presentation/base/base_viewmodel.dart';
import 'package:flutteradvanced/presentation/common/freezed_data_classses.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  LoginObject loginObject = LoginObject('', '');

  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void login() {
    // TODO: implement login
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject.copyWith(password: password);
  }

  @override
  void setUserName(String userName) {
    inputUserName.add(userName);
    loginObject.copyWith(username: userName);
  }

  @override
  // TODO: implement userName
  Sink get inputUserName => _usernameStreamController.sink;

  @override
  // TODO: implement password
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Stream<bool> get isPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get isUsernameValid => _usernameStreamController.stream
      .map((userName) => _isUsernameValid(userName));

  // private functions

  bool _isPasswordValid(String password) {
    return password.isEmpty;
  }

  bool _isUsernameValid(String userName) {
    return userName.isEmpty;
  }
}

// inputs from view to view-model

abstract class LoginViewModelInputs {
  // three actions

  void setUserName(String userName);
  void setPassword(String password);
  void login();

  // two sinks
  // sink is the data to be passed to a stream-controller

  Sink get inputUserName;
  Sink get inputPassword;
}

// output from view-model to view

abstract class LoginViewModelOutputs {
  Stream<bool> get isUsernameValid;
  Stream<bool> get isPasswordValid;
}
