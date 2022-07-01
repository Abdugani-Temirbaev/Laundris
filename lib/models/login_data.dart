class LoginData {
  LoginData({this.token});

  String? token;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(token: json['token']);
}