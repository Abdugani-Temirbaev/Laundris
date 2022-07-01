import 'package:laundris/models/base_response.dart';
import 'package:laundris/models/login_data.dart';
import 'package:laundris/models/login_request.dart';
import 'package:laundris/models/register_request.dart';
import 'package:laundris/models/check_answer_request.dart';
import 'package:laundris/network/api_end_points.dart';
import 'package:laundris/network/network_api_service.dart';

class AuthRepository {
  final NetworkApiService _apiService = NetworkApiService();
  final ApiEndPoints _endPoints = ApiEndPoints();

  Future<BaseResponse<T>?> genericRequest<T>(RequestType requestType, url, dynamic? body) async {
    try {
      dynamic response = await _apiService.fetchResponse(requestType, url, body);
      return BaseResponse<T>.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NoDataResponse?> genericRequestNDR(RequestType requestType, url, dynamic body) async {
    // NDR => no data response class
    try {
      dynamic response = await _apiService.fetchResponse(requestType, url, body);
      return NoDataResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NoDataResponse?> checkToken() async => genericRequestNDR(RequestType.post, _endPoints.check_token, null);

  Future<BaseResponse<LoginData>?> login(LoginRequest body) async => genericRequest<LoginData>(RequestType.post, _endPoints.login, body.toJson());

  Future<BaseResponse<LoginData>?> register(RegisterRequest body) async =>
      genericRequest<LoginData>(RequestType.post, _endPoints.register, body.toJson());

  Future<BaseResponse<LoginData>?> checkSecretAnswer(CheckAnswerRequest body) async =>
      genericRequest(RequestType.post, _endPoints.check_secret_answer, body.toJson());
}
