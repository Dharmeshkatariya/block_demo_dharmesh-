class UserDetailsResModel {
  UserDetailsResModel();

  late final int isSuccess;
  late final String code;
  late final UserModelDetail userModel;
  late final String message;

  UserDetailsResModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    code = json['code'];
    userModel = UserModelDetail.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['code'] = code;
    _data['data'] = userModel.toJson();
    _data['message'] = message;
    return _data;
  }
}

class UserModelDetail {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? username;
  final String? city;
  final int? isAdmin;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? googleId;
  final String? fbId;
  final String? image;
  final String? token;
  final String? otp;
  final String? district;
  final String? tehsil;

  UserModelDetail({
    this.id,
    this.otp,
    this.name,
    this.token,
    this.email,
    this.mobile,
    this.username,
    this.city,
    this.isAdmin,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.googleId,
    this.fbId,
    this.image,
    this.district,
    this.tehsil
  });

  UserModelDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? "",
        otp = json["otp"] ?? "",
        token = json["token"]??"",
        email = json['email']??"",
        mobile = json['mobile'] ?? "",
        username = json['username'] ?? "",
        city = json['city'] ??"",
        isAdmin = json['is_admin'] ?? 0,
        emailVerifiedAt = json['email_verified_at'] ?? "",
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        googleId = json['google_id'] ?? "",
        fbId = json['fb_id'] ?? "",
        image = json['image'] ?? "",
        district = json['district'] ?? "",
        tehsil = json['tehsil'] ?? ""

  ;



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'username': username,
      'city': city,
      'is_admin': isAdmin,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'google_id': googleId,
      'fb_id': fbId,
      'image': image,
    };
  }
}
