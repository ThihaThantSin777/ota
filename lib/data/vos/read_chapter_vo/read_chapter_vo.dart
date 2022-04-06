class ReadChapterVO {
  String? mangaId;
  String? chptId;
  String? chptThumb;
  String? chptSum;
  String? chptNum;

  ReadChapterVO(
      {this.mangaId, this.chptId, this.chptThumb, this.chptSum, this.chptNum});

  ReadChapterVO.fromJson(Map<String, dynamic> json) {
    mangaId = json['manga_id'];
    chptId = json['chpt_id'];
    chptThumb = json['chpt_thumb'];
    chptSum = json['chpt_sum'];
    chptNum = json['chpt_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['manga_id'] = mangaId;
    data['chpt_id'] = chptId;
    data['chpt_thumb'] = chptThumb;
    data['chpt_sum'] = chptSum;
    data['chpt_num'] = chptNum;
    return data;
  }
}
