class Subject {
  Subject({
    this.image,
    this.id,
    this.name,
  });

  final String? image;
  final int? id;
  final String? name;

  Subject.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
