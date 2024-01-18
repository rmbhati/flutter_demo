//{"result":"true","data":[{"EMP_ID":50226,"FULL_NAME":"Karthigeyan M"}]}
class LoginModel {
  String sts;
  String message;
  List<LoginData>? data;

  LoginModel(this.sts, this.message, [this.data]);

  factory LoginModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      var dataObsJson = json['data'] as List;
      List<LoginData> data =
          dataObsJson.map((dataJson) => LoginData.fromJson(dataJson)).toList();

      return LoginModel(
          json['result'] as String, json['MESSAGE'] as String, data);
    } else {
      return LoginModel(
          json['result'] as String, json['MESSAGE'] as String, null);
    }
  }

  Map<String, dynamic> toJson() => {
        "result": sts,
        "MESSAGE": message,
        "data": data,
      };
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
