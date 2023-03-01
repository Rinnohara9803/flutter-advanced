import 'dart:async';

import 'package:flutteradvanced/presentation/base/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  @override
  void dispose() {
    // TODO: implement dispose
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
    // TODO: implement setPassword
  }

  @override
  void setUserName(String userName) {
    // TODO: implement setUserName
  }

  @override
  // TODO: implement userName
  Sink get inputUserName => _usernameStreamController.sink;

  @override
  // TODO: implement password
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement isPasswordValid
  Stream<bool> get isPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement isUsernameValid
  Stream<bool> get isUsernameValid => throw UnimplementedError();
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
