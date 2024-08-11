class District {
  final String ? name;
  final  List<String> ?  tehsils;

  District({
     this.name,
     this.tehsils,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      name: json['name'],
      tehsils: List<String>.from(json['tehsils']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tehsils': tehsils,
    };
  }
}

class DistrictList {
  final List<District>? districts;

  DistrictList({
     this.districts,
  });

  factory DistrictList.fromJson(Map<String, dynamic> json) {
    List<District> districts = [];
    if (json['districts'] != null) {
      json['districts'].forEach((district) {
        districts.add(District.fromJson(district));
      });
    }
    return DistrictList(
      districts: districts,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> districtList = [];
    districts!.forEach((district) {
      districtList.add(district.toJson());
    });
    return {
      'districts': districtList,
    };
  }
}
