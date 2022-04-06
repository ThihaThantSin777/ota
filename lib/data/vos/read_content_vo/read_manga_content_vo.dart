class ReadMangaContentVO {
  String? cId;
  String? chptId;
  String? url;
  String? cNum;

  ReadMangaContentVO({this.cId, this.chptId, this.url, this.cNum});

  ReadMangaContentVO.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    chptId = json['chpt_id'];
    url = json['url'];
    cNum = json['c_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c_id'] = cId;
    data['chpt_id'] = chptId;
    data['url'] = url;
    data['c_num'] = cNum;
    return data;
  }
}
