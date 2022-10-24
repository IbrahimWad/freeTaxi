class UserModel {
  late String phone, name, gender;

  UserModel({
    required this.phone,
    required this.name,
    required this.gender,
  });

  UserModel.fromeJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    gender = map['gender'];
    phone = map['phone'];
    name = map['name'];
  }

  toJson() {
    return {
      'gender': gender,
      'phone': phone,
      'name': name,
    };
  }
}
