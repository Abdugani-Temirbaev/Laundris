class NoDataResponse {
  NoDataResponse({this.state, this.errorText, this.code});

  String? state;
  String? errorText;
  int? code;

  factory NoDataResponse.fromJson(Map<String, dynamic> json) => NoDataResponse(state: json['state'] ?? '', errorText: json['error_text'] ?? '', code: json['code'] ?? 1);
}

class BaseResponse<T> {
  BaseResponse({required this.data, this.state, this.errorText, this.code});

  T data;
  String? state;
  String? errorText;
  int? code;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      BaseResponse<T>(data: json['data'], state: json['state'] ?? '', errorText: json['error_text'] ?? '', code: json['code'] ?? 1);
}
