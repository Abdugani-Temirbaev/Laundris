class RegisterRequest {
  RegisterRequest({required this.password, required this.type, required this.twoFactor, required this.questionId, required this.answer});

  String password;
  String type;
  int twoFactor;
  String questionId;
  String answer;

  Map<String, dynamic> toJson() => {'password': password, 'type': type, 'two_factor': twoFactor, 'question_id': questionId, 'answer': answer};
}
