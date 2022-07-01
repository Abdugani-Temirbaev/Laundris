class LoginRequest {
  LoginRequest({required this.phone, required this.password, required this.type});

  String phone;
  String password;
  String type;

  Map<String, dynamic> toJson() => {'phone': phone, 'password': password, 'type': type};
}
