class FeedBackResModel {
  FeedBackResModel();

  late final int isSuccess;
  late final String code;
  late final FeedBackData data;
  late final String message;

  FeedBackResModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    code = json['code'];
    data = FeedBackData.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['code'] = code;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}



class FeedBackData {
  FeedBackData({
    this.userId,
    this.feedback,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  final int? userId;
  final String? feedback;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  FeedBackData.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        feedback = json['feedback'],
        updatedAt = json['updated_at'],
        createdAt = json['created_at'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['feedback'] = feedback;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
