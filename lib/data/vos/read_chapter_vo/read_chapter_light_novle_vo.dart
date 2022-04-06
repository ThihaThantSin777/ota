class ReadLightNovelVO {
  String? lightnovelId;
  String? chptId;
  String? chptThumb;
  String? chptSum;
  String? chptNum;

  ReadLightNovelVO(
      {this.lightnovelId,
      this.chptId,
      this.chptThumb,
      this.chptSum,
      this.chptNum});

  ReadLightNovelVO.fromJson(Map<String, dynamic> json) {
    lightnovelId = json['lightnovel_id'];
    chptId = json['chpt_id'];
    chptThumb = json['chpt_thumb'];
    chptSum = json['chpt_sum'];
    chptNum = json['chpt_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lightnovel_id'] = lightnovelId;
    data['chpt_id'] = chptId;
    data['chpt_thumb'] = chptThumb;
    data['chpt_sum'] = chptSum;
    data['chpt_num'] = chptNum;
    return data;
  }
}
