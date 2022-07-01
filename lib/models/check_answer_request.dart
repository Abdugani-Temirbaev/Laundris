class CheckAnswerRequest {
  CheckAnswerRequest({required this.phone, required this.answer});

  String phone;
  String answer;

  Map<String, dynamic> toJson() => {'phone': phone, 'answer': answer};
}
