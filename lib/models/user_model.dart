class UserProfile {

  String email;
  String name;
  String mobileNumber;
  String city;
  String userProfileFileImg;
  String userImage;


  UserProfile({
    required this.email,
    required this.name,
    required this.mobileNumber,
    required this.city,
    required this.userProfileFileImg,
    required this.userImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'mobileNumber': mobileNumber,
      'city': city,
      'userProfileFileImg': userProfileFileImg,
      'userImage': userImage,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json['email'],
      name: json['name'],
      mobileNumber: json['mobileNumber'],
      city: json['city'],
      userProfileFileImg: json['userProfileFileImg'],
      userImage: json['userImage'],
    );
  }

}


