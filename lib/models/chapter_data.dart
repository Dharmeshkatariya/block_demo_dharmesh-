class ChapterData {
  ChapterData({
    this.image,
    this.videoUrl ,
    this.pdf,
    this.id,
    this.name,
  });

  final String? image;
  final int? id;
  final String? name;
  final String? pdf;
  final String? videoUrl;

  ChapterData.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        pdf = json["pdf"] ,
        id = json['id'],
        videoUrl =  json["video_url"] ,
        name = json['name'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['id'] = id;
    _data['name'] = name;
    _data['pdf'] = pdf;
    _data['video_url'] = pdf;
    return _data;
  }
}
