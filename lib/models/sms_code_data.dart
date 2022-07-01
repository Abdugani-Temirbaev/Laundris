class SmsCodeData {
  SmsCodeData({this.confirmation, this.sendTo});

  bool? confirmation;
  String? sendTo;

  factory SmsCodeData.fromJson(Map<String, dynamic> json) => SmsCodeData(confirmation: json['confirmation'], sendTo: json['send_to']);
}
