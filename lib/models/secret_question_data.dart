class SecretQuestionData {
  SecretQuestionData({this.id, this.text});

  String? id;
  String? text;

  factory SecretQuestionData.fromJson(Map<String, dynamic> json) => SecretQuestionData(id: json['id'], text: json['text']);
}
