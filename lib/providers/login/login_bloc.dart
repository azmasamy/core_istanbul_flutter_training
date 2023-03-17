import 'package:coreapp1/models/response.dart';
import 'package:coreapp1/models/user.dart';
import 'package:coreapp1/services/mock_login_service.dart';
import 'package:coreapp1/utils/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';

enum LoginState { initial, loading, failed, succeeded }

class LoginBloc extends ChangeNotifier {
  //make singleton
  LoginBloc._privateConstructor();
  static final LoginBloc _instance = LoginBloc._privateConstructor();
  factory LoginBloc() {
    return _instance;
  }
  LoginState state = LoginState.initial;
  bool obscureText = true;
  String errorMessage = "";
  User? loggedInUser;

  toggleObsecurePassword() {
    obscureText = !obscureText;
    notifyListeners();
  }

  login(GlobalKey<FormState> formKey, String email, String password) async {
    if (formKey.currentState!.validate()) {
      updateState(LoginState.loading);
      //call login api
      try {
        Response response = await MockLoginService.login(email, password);
        if (response.isOperationSuccessful) {
          updateState(LoginState.succeeded);
          loggedInUser = response.data;
        } else {
          errorMessage = response.message;
          updateState(LoginState.failed);
        }
      } catch (e) {
        errorMessage = e.toString();
        updateState(LoginState.failed);
      }
    }
  }

  String? validateEmail(String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (email != null && regExp.hasMatch(email)) {
      return null;
    } else {
      const String errorText = StringConstants.emailFieldError;
      return errorText;
    }
  }

  updateState(LoginState state) {
    this.state = state;
    notifyListeners();
  }
}
