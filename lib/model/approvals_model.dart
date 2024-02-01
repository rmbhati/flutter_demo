
class ApproveModel {
  bool sts;
  String message;
  List<ApproveData>? data;

  ApproveModel(this.sts, this.message, [this.data]);

  factory ApproveModel.fromJson(dynamic json) {
    if (json['RESULT'] != null) {
      var dataObsJson = json['RESULT'] as List;
      List<ApproveData> data = dataObsJson
          .map((dataJson) => ApproveData.fromJson(dataJson))
          .toList();

      return ApproveModel(json['STATUS'], json['MESSAGE'], data);
    } else {
      return ApproveModel(json['STATUS'], json['MESSAGE'], null);
    }
  }

  Map<String, dynamic> toJson() => {
        "STATUS": sts,
        "MESSAGE": message,
        "RESULT": data,
      };
}

class ApproveData {
  ApproveData({
    required this.id,
    required this.code,
    required this.count,
  });

  int id;
  String code;
  int count;

  factory ApproveData.fromJson(Map<String, dynamic> json) => ApproveData(
        id: json["VF_STAGE_ID"],
        code: json["VF_CODE"],
        count: json["BC_COUNT"],
      );

  Map<String, dynamic> toJson() => {
        "VF_STAGE_ID": id,
        "VF_CODE": code,
        "BC_COUNT": count,
      };
}
