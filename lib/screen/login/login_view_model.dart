import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/login/login_model.dart';

import '../../service/api_service.dart';
import '../../utils/strings.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  Future<LoginModel> login(
      BuildContext context, String name, String pwd) async {
    if (formKey.currentState!.validate()) {
      LoginModel loginModel = (await ApiService().getLoginData(name, pwd));
      return loginModel;
    } else {
      return LoginModel("false", Strings.enterAllDetails, null);
    }
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please enter username';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return Strings.enterPassword;
    }
    return null;
  }
}
