import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/login_model.dart';
import '../model/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<LoginModel> getLoginData(String user, String pwd) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}$user/$pwd");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> valueMap = json.decode(response.body);
        LoginModel user = LoginModel.fromJson(valueMap);
        return user;
      } else {
        //return LoginModel(sts: false, message: "Failed to login");
        return LoginModel(false, "Failed to login", null);
      }
    } catch (e) {
      return LoginModel(false, "Failed to login", null);
    }
  }
}
