class SignOtpModel {
  late String phone;

  SignOtpModel({required this.phone});
  SignOtpModel.fromeJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    phone = map['phone'];
  }

  toJson() {
    return {
      'phone': phone,
    };
  }
}
