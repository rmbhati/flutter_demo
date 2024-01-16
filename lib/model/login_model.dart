class LoginModel {
  bool sts;
  String message;
  List<LoginData>? data;

  LoginModel(this.sts, this.message, [this.data]);

  factory LoginModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      var dataObsJson = json['data'] as List;
      List<LoginData> data =
          dataObsJson.map((dataJson) => LoginData.fromJson(dataJson)).toList();

      return LoginModel(
          json['STATUS'] as bool, json['MESSAGE'] as String, data);
    } else {
      return LoginModel(
          json['STATUS'] as bool, json['MESSAGE'] as String, null);
    }
  }

  /*factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        sts: json["STATUS"],
        message: json["MESSAGE"],
        data: LoginData.fromJson(json["data"]),
      );*/

  Map<String, dynamic> toJson() => {
        "STATUS": sts,
        "MESSAGE": message,
        "data": data,
      };

  @override
  String toString() {
    return '{ $sts, $message, $data }';
  }
}

class LoginData {
  LoginData({
    required this.empID,
    required this.fullName,
  });

  int empID;
  String fullName;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        empID: json["EMP_ID"],
        fullName: json["FULL_NAME"],
      );

  Map<String, dynamic> toJson() => {
        "EMP_ID": empID,
        "FULL_NAME": fullName,
      };
}
