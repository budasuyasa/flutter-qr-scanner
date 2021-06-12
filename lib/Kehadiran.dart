class Kehadiran {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? avatar;
  String? attend;
  String? createdAt;
  String? updatedAt;

  Kehadiran(
      {required this.id,
      required this.name,
      required this.email,
      required this.emailVerifiedAt,
      required this.avatar,
      required this.attend,
      required this.createdAt,
      required this.updatedAt});

  Kehadiran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    avatar = json['avatar'];
    attend = json['attend'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['avatar'] = this.avatar;
    data['attend'] = this.attend;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
