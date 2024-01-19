import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/login_model.dart';
import '../model/user_model.dart';

class ApiService {
  Future<LoginModel> getLoginData(String user, String pwd) async {
    try {
      var url =
          Uri.parse("${Constants.baseUrl}${Constants.usersEndpoint}$user/$pwd");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> valueMap = json.decode(response.body);
        LoginModel user = LoginModel.fromJson(valueMap);
        return user;
      } else {
        return LoginModel("false", "Failed to login", null);
      }
    } catch (e) {
      return LoginModel("false", "Failed to login ${e.toString()}", null);
    }
  }

  Future<LoginModel> sendLoginPostRequest(
      BuildContext context, String user, String pwd) async {
    var response = await http.post(Constants.uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userId": "7010", "password": "Rajag@!23"}));

    if (response.statusCode == 200) {
      return LoginModel("true", response.body.toString(), null);
    } else {
      return LoginModel("false", "Failed to login", null);
    }
  }

  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
