import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';
import '../model/login_model.dart';

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

  Future<ApproveModel> getApprovalsData(int userID) async {
    try {
      var url =
          Uri.parse("${Constants.baseUrl}${Constants.get_all_bc_count}$userID");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> valueMap = json.decode(response.body);
        ApproveModel model = ApproveModel.fromJson(valueMap);
        return model;
      } else {
        return ApproveModel(false, "Failed to Load Data", null);
      }
    } catch (e) {
      log(e.toString());
      return ApproveModel(false, "Failed to Load Data", null);
    }
  }
}
