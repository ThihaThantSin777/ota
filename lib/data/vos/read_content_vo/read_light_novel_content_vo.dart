class ReadLightNovelContentVO {
  String? nvconId;
  String? chptId;
  String? nvconBody;

  ReadLightNovelContentVO({this.nvconId, this.chptId, this.nvconBody});

  ReadLightNovelContentVO.fromJson(Map<String, dynamic> json) {
    nvconId = json['nvcon_id'];
    chptId = json['chpt_id'];
    nvconBody = json['nvcon_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nvcon_id'] = nvconId;
    data['chpt_id'] = chptId;
    data['nvcon_body'] = nvconBody;
    return data;
  }
}
