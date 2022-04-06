class ReadArticleVO {
  String? arconId;
  String? artId;
  String? arconNum;
  String? arconType;
  String? arconBody;

  ReadArticleVO(
      {this.arconId,
      this.artId,
      this.arconNum,
      this.arconType,
      this.arconBody});

  ReadArticleVO.fromJson(Map<String, dynamic> json) {
    arconId = json['arcon_id'];
    artId = json['art_id'];
    arconNum = json['arcon_num'];
    arconType = json['arcon_type'];
    arconBody = json['arcon_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arcon_id'] = arconId;
    data['art_id'] = artId;
    data['arcon_num'] = arconNum;
    data['arcon_type'] = arconType;
    data['arcon_body'] = arconBody;
    return data;
  }
}
